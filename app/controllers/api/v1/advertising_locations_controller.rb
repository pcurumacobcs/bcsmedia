class Api::V1::AdvertisingLocationsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find advertising_location
  before_action :find_advertising_location, :only => [:update, :get_advertising_location, :destroy]

  # GET /advertising_locations
  def get_advertising_locations
    @advertising_locations = AdvertisingLocation.all

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
    @advertising_location = AdvertisingLocation.new(advertising_location_params)

    if @advertising_location.save
      render json: @advertising_location, status: :created
    end
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
