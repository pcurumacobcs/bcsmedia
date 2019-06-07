class Api::V1::LocationNearbyPlaceTagsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]
  before_action :authorize_request
  # find
  before_action :find_location_np_tag, :only => [:destroy]

  # POST /locations/nearby_place_tag
  def create
    @location_np_tag = LocationNearbyPlaceTag.new(location_np_tag_params)

    if @location_np_tag.save
      render json: @location_np_tag, status: :created
    end
  end

  # DELETE /locations/nearby_place_tag
  def destroy
    unless @location_np_tag.destroy
      render json: { errors: @location_np_tag.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find locations nearby_place_tag
  def find_location_np_tag
    @location_np_tag = LocationNearbyPlaceTag.where(location_id: params[:location_id], nearby_place_tag_id: params[:nearby_place_tag_id]).first
    if @location_np_tag.nil?
      resource_not_found
    end
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params locations nearby_place_tag
  def location_np_tag_params
    params.permit(
      :location_id,
      :nearby_place_tag_id,
    )
  end
end
