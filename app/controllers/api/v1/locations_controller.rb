class Api::V1::LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find
  before_action :find_location, :only => [:update, :destroy]

  # GET /locations
  def get_locations
    @locations = Location.all

    if !@locations.any?
      resource_not_found
    else
      render json: { 'data': @locations, 'status': 1 }
    end
  end

  # GET /locations/filter
  def get_locations_search
    if Integer(params[:type_id]) != 0
      @locations = Location.where(location_type_id: params[:type_id]).where(status: 1)
    else
      @locations = Location.where(status: 1)
    end

    if !@locations.any?
      resource_not_found
    else
      response_to_maps

      # return my array with my structure
      if params[:start_date] && params[:end_date]
        render json: {
          'data': @response,
          'date': {
            'rangeDate': {
              'start': params[:start_date],
              'end': params[:end_date]
            }
          },
          'status': 1
        }
      else
        render json: { 'data': @response, 'status': 1 }
      end
    end
  end

  # GET /get_locations_ads
  def get_locations_ads
    @locations = Location.where(status: 1)

    if !@locations.any?
      resource_not_found
    else
      response_to_maps

      # return my array with my structure
      render json: { 'data': @response, 'status': 1 }
    end
  end

  # POST /locations
  def create
    @location = Location.new(locations_params)

    if @location.save
      render json: @location, status: :created
    end
  end

  # PUT /locations
  def update
    unless @location.update(locations_params)
      render json: { errors: @location.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      render json: @location
    end
  end

  # DELETE /locations
  def destroy
    unless @location.destroy
      render json: { errors: @location.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find locations
  def find_location
    @location = Location.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params locations
  def locations_params
    params.permit(
      :name,
      :address,
      :location_type_id,
      :business_email,
      :lat,
      :lng,
    )
  end

  def response_to_maps
    # make array for response
    @response = []

    @locations.each do |location|

      # get locations screens
      screens = Screen.where(location_id: location[:id])
      # make structure for @response
      myLocation = {
        :id => location.id,
        :name => location.name,
        :address => location.address,
        # object called position 'cause the API for Maps need this format
        :position => {
          # :lat and :lng most be float number
          :lat => Float(location.lat),
          :lng => Float(location.lng)
        },
        # count screens array
        :screens => screens.count, 
        # all by default in false 'cause they are not selected
        :selected => false
      }
      
      # push array like JS
      @response.push(myLocation)
    end
  end
end
