class Api::V1::ScreenInstallationsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find screens types
  before_action :find_screen_installation, :only => [:update, :destroy]

  # GET /screens/installations
  def get_screen_installations
    if params[:screen_id].present?
      @installations = ScreenInstallation.where(screen_id: params[:screen_id])
    else
      @installations = ScreenInstallation.all
    end

    if !@installations.any?
      resource_not_found
    else
      render json: { 'data': @installations, 'status': 1 }
    end
  end

  # POST /screens/installations
  def create
    @installation = ScreenInstallation.new(installations_params)

    if @installation.save
      render json: @installation, status: :created
    end
  end

  # PUT /screens/installations
  def update
    unless @installation.update(installations_params)
      render json: { errors: @installation.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      render json: @installation
    end
  end

  # DELETE /screens/installations
  def destroy
    unless @installation.destroy
      render json: { errors: @installation.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find screens types
  def find_screen_installation
    @installation = ScreenInstallation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params screens types
  def installations_params
    params.permit(
      :screen_id,
      :name,
      :date,
      :description,
    )
  end
end
