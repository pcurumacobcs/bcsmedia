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
      render json: { errors: @location.errors.full_messages },
             status: :unprocessable_entity
    else
      render json: @location
    end
  end

  # DELETE /locations
  def destroy
    unless @location.destroy
      render json: { errors: @location.errors.full_messages },
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
end
