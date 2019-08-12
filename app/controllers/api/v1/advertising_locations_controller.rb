class Api::V1::AdvertisingLocationsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find advertising_location
  before_action :find_advertising_location, :only => [:update, :get_advertising_location, :destroy]

  # GET /advertising_locations
  def get_advertising_locations
    if params[:advertising_id]
      @advertising_locations = AdvertisingLocation.where(advertisements_id: params[:advertising_id])
    else
      @advertising_locations = AdvertisingLocation.all
    end

    if !@advertising_locations.any?
      resource_not_found
    else
      render json: { 'data': @advertising_locations, 'status': 1 }
    end
  end

  # GET /advertising_location
  def get_advertising_location
    
    render json: { 'data': @advertising_location, 'status': 1 }
  end

  # POST /advertising_location
  def create
    ad_id = params[:advertising_id]
    locations = params[:locations]
    locations_selected = []

    # this locations is from params
    locations.each do |location|
      # find by advertising_id and location_id
      advertising_location = AdvertisingLocation.find_by advertisements_id: ad_id, locations_id: location[:id]
      
      # if location is selected...
      if location[:selected]
        # if is selected and doesn't exist
        if advertising_location.nil?
          advertising_location = AdvertisingLocation.new(
            :advertisements_id => ad_id,
            :locations_id => location[:id]
          )
          advertising_location.save
        end
      else
        # if isn't selected and exist, destroy
        if !advertising_location.nil?
          advertising_location.destroy
        end
      end # end if selected...
    end
    # end locations.each

    # now, get locations selected
    locations_selected = []    
    # search where advertising is equal
    advertising_locations = AdvertisingLocation.where advertisements_id: ad_id
    advertising_locations.each do |ad_location|
      # return json format to have control of its properties
      location = Location.find(ad_location[:locations_id]).as_json(only: [:id, :name, :address, :status])

      # add new field
      location[:show_screens] = false
      locations_selected.push(location)
    end

    render json: locations_selected, status: :created
  end

  # PUT /advertising_location
  def update
    unless @advertising_location.update(advertising_location_params)
      render json: { errors: @advertising_location.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      render json: @advertising_location
    end
  end

  # DELETE /advertising_location
  def destroy
    unless @advertising_location.destroy
      render json: { errors: @advertising_location.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find advertising_location
  def find_advertising_location
    @advertising_location = AdvertisingLocation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params advertising_location
  def advertising_location_params
    params.permit(
      :advertisements_id,
      :locations_id,
      :status
    )
  end
end
