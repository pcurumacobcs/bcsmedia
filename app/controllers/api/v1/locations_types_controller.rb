class Api::V1::LocationsTypesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find locations
  before_action :find_location_type, :only => [:update, :destroy]

  # GET /locations/types
  def get_locations_types
    @types = LocationType.all

    if !@types.any?
      resource_not_found
    else
      render json: { 'data': @types, 'status': 1 }
    end
  end

  # POST /locations/types
  def create
    @type = LocationType.new(locations_types_params)

    if @type.save
      render json: @type, status: :created
    end
  end

  # PUT /locations/types
  def update
    unless @type.update(locations_types_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    else
      render json: @type
    end
  end

  # DELETE /locations/types
  def destroy
    unless @type.destroy
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find locations type
  def find_location_type
    @type = LocationType.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params locations
  def locations_types_params
    params.permit(
      :name
    )
  end
end
