class Api::V1::NearbyPlaceTagController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find locations
  before_action :find_nearby_place_tag, :only => [:update, :destroy]

  # GET /locations/nearby_place_tag
  def get_nearby_place_tag
    @nearby_places = NearbyPlaceTag.all

    if !@nearby_places.any?
      resource_not_found
    else
      render json: { 'data': @nearby_places, 'status': 1 }
    end
  end

  # POST /locations/nearby_place_tag
  def create
    @nearby_places = NearbyPlaceTag.new(nearby_place_tag_params)

    if @nearby_places.save
      render json: @nearby_places, status: :created
    end
  end

  # PUT /locations/nearby_place_tag
  def update
    unless @nearby_places.update(nearby_place_tag_params)
      render json: { errors: @nearby_places.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      render json: @nearby_places
    end
  end

  # DELETE /locations/nearby_place_tag
  def destroy
    unless @nearby_places.destroy
      render json: { errors: @nearby_places.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find locations nearby place tag
  def find_nearby_place_tag
    @nearby_places = NearbyPlaceTag.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params locations
  def nearby_place_tag_params
    params.permit(
      :name
    )
  end
end
