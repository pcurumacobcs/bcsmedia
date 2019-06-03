class Api::V1::LocationPhonesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find
  before_action :find_phone_number, :only => [:update, :destroy]

  # GET /locations/phones
  def get_phone_numbers
    if params[:id].present?
      @phone_numbers = LocationPhone.where(location_id: params[:id])
    else
      @phone_numbers = LocationPhone.all
    end

    # Return phone numbers
    if !@phone_numbers.any?
      resource_not_found
    else
      render json: { 'data': @phone_numbers, 'status': 1 }
    end
  end

  # POST /locations/phones
  def create
    @phone_number = LocationPhone.new(phone_number_params)

    if @phone_number.save
      render json: @phone_number, status: :created
    end
  end

  # PUT /locations/phones
  def update
    unless @phone_number.update(phone_number_params)
      render json: { errors: @phone_number.errors.full_messages },
             status: :unprocessable_entity
    else
      render json: @phone_number
    end
  end

  # DELETE /locations/phones
  def destroy
    unless @phone_number.destroy
      render json: { errors: @phone_number.errors.full_messages },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find phone_number
  def find_phone_number
    @phone_number = LocationPhone.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params phone_number
  def phone_number_params
    params.permit(
      :location_id,
      :phone_number,
    )
  end
end
