class Api::V1::ScreensController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find screen
  before_action :find_screen, :only => [:update, :destroy]

  # GET /screens
  def get_screens
    if params[:location_id].present?
      @screens = Screen.where(location_id: params[:location_id])
    else
      @screens = Screen.all
    end

    if !@screens.any?
      resource_not_found
    else
      render json: { 'data': @screens, 'status': 1 }
    end
  end

  # POST /screens
  def create
    @screen = Screen.new(screens_params)

    if @screen.save
      render json: @screen, status: :created
    end
  end

  # PUT /screens
  def update
    unless @screen.update(screens_params)
      render json: { errors: @screen.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      render json: @screen
    end
  end

  # DELETE /screens
  def destroy
    unless @screen.destroy
      render json: { errors: @screen.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find screens
  def find_screen
    @screen = Screen.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params screens
  def screens_params
    params.permit(
      :screen_type_id,
      :screen_brand_id,
      :location_id,
      :code,
      :model,
      :sku,
      :orientation,
      :size_inches,
      :description,
      :status,
    )
  end
end
