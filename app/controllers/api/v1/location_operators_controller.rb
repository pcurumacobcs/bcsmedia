class Api::V1::LocationOperatorsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]
  before_action :authorize_request
  # find
  before_action :find_location_operator, :only => [:destroy]

  # POST /locations/operators
  def create
    @location_operator = LocationOperator.new(location_operator_params)

    if @location_operator.save
      render json: @location_operator, status: :created
    end
  end

  # DELETE /locations/operators
  def destroy
    unless @location_operator.destroy
      render json: { errors: @location_operator.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find locations operators
  def find_location_operator
    @location_operator = LocationOperator.where(location_id: params[:location_id], operator_id: params[:operator_id]).first
    if @location_operator.nil?
      resource_not_found
    end
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params locations operators
  def location_operator_params
    params.permit(
      :location_id,
      :operator_id,
    )
  end
end
