class Api::V1::PlaceInstallationsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find screens place installation
  before_action :find_place_installation, :only => [:update, :destroy]

  # GET /screens/place/installations
  def get_place_installations
    if params[:screen_id].present?
      @installations = PlaceInstallation.where(screen_id: params[:screen_id])
    else
      @installations = PlaceInstallation.all
    end

    if !@installations.any?
      resource_not_found
    else
      render json: { 'data': @installations, 'status': 1 }
    end
  end

  # POST /screens/place/installations
  def create
    @installation = PlaceInstallation.new(installations_params)

    if @installation.save
      render json: @installation, status: :created
    end
  end

  # PUT /screens/place/installations
  def update
    unless @installation.update(installations_params)
      render json: { errors: @installation.errors.full_messages, status: 0 }, status: :unprocessable_entity
    else
      render json: @installation
    end
  end

  # DELETE /screens/place/installations
  def destroy
    unless @installation.destroy
      render json: { errors: @installation.errors.full_messages, status: 0 }, status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find screens place installation
  def find_place_installation
    @installation = PlaceInstallation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params screens place installation
  def installations_params
    params.permit(
      :screen_id,
      :type,
      :nids,
      :antireflective,
    )
  end
end
