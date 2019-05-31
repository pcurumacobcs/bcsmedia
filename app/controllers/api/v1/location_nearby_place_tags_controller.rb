class Api::V1::LocationNearbyPlaceTagsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]
  before_action :authorize_request
  # find
  before_action :find_location_np_tag, :only => [:destroy]

  # POST /locations/business_type
  def create
    @location_np_tag = LocationNearbyPlaceTag.new(location_np_tag_params)

    if @location_np_tag.save
      render json: @location_np_tag, status: :created
    end
  end

  # DELETE /locations/business_type
  def destroy
    unless @location_np_tag.destroy
      render json: { errors: @location_np_tag.errors.full_messages },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find locations business_type
  def find_location_np_tag
    @location_np_tag = LocationNearbyPlaceTag.where(location_id: params[:location_id], nearby_place_tag_id: params[:nearby_place_tag_id]).first
    if @location_np_tag.nil?
      resource_not_found
    end
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params locations business_type
  def location_np_tag_params
    params.permit(
      :location_id,
      :nearby_place_tag_id,
    )
  end
end
