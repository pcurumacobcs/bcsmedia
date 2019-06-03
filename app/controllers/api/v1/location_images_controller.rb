class Api::V1::LocationImagesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find
  before_action :find_location_image, :only => [:update, :destroy]

  # GET /locations/images
  def get_images
    if params[:id].present?
      @location_images = LocationImage.where(location_id: params[:id])
    else
      @location_images = LocationImage.all
    end

    # Return location_images
    if !@location_images.any?
      resource_not_found
    else
      render json: { 'data': @location_images, 'status': 1 }
    end
  end

  # POST /locations/images
  def create
    @location_image = LocationImage.new(location_image_params)

    if @location_image.save
      render json: @location_image, status: :created
    end
  end

  # PUT /locations/images
  def update
    unless @location_image.update(location_image_params)
      render json: { errors: @location_image.errors.full_messages },
             status: :unprocessable_entity
    else
      render json: @location_image
    end
  end

  # DELETE /locations/images
  def destroy
    unless @location_image.destroy
      render json: { errors: @location_image.errors.full_messages },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find location_image
  def find_location_image
    @location_image = LocationImage.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params location_image
  def location_image_params
    params.permit(
      :location_id,
      :url_image,
    )
  end
end
