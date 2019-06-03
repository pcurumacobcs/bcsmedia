class Api::V1::LocationInstallationDatesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find
  before_action :find_location_installation, :only => [:update, :destroy]

  # GET /locations/installation
  def get_locations_installation
    if params[:id].present?
      @location_installations = LocationInstallationDate.where(location_id: params[:id])
    else
      @location_installations = LocationInstallationDate.all
    end

    # Return installations
    if !@location_installations.any?
      resource_not_found
    else
      render json: { 'data': @location_installations, 'status': 1 }
    end
  end

  # POST /locations/installation
  def create
    # render json: { 'date_time': params[:date_time] }
    @location_installation = LocationInstallationDate.new(location_installations_params)

    if @location_installation.save
      render json: @location_installation, status: :created
    end
  end

  # PUT /locations/installation
  def update
    unless @location_installation.update(location_installations_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    else
      render json: @location_installation
    end
  end

  # DELETE /locations/installation
  def destroy
    unless @location_installation.destroy
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find locations
  def find_location_installation
    @location_installation = LocationInstallationDate.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params locations
  def location_installations_params
    params.permit(
      :location_id,
      :date_time, # format: yyyy-mm-dd hh:ii
      :comments
    )
  end
end
