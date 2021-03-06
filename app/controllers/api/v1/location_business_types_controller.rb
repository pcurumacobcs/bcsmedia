class Api::V1::LocationBusinessTypesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]
  before_action :authorize_request
  # find
  before_action :find_location_bt, :only => [:destroy]

  # POST /locations/business_type
  def create
    @location_bt = LocationBusinessType.new(location_bt_params)

    if @location_bt.save
      render json: @location_bt, status: :created
    end
  end

  # DELETE /locations/business_type
  def destroy
    unless @location_bt.destroy
      render json: { errors: @location_bt.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find locations business_type
  def find_location_bt
    @location_bt = LocationBusinessType.where(location_id: params[:location_id], business_type_id: params[:business_type_id]).first
    if @location_bt.nil?
      resource_not_found
    end
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params locations business_type
  def location_bt_params
    params.permit(
      :location_id,
      :business_type_id,
    )
  end
end
