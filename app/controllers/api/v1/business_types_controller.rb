class Api::V1::BusinessTypesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find locations
  before_action :find_business_type, :only => [:update, :destroy]

  # GET /locations/business_types
  def get_business_types
    @business = BusinessType.all

    if !@business.any?
      resource_not_found
    else
      render json: { 'data': @business, 'status': 1 }
    end
  end

  # POST /locations/business_types
  def create
    @business = BusinessType.new(business_types_params)

    if @business.save
      render json: @business, status: :created
    end
  end

  # PUT /locations/business_types
  def update
    unless @business.update(business_types_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    else
      render json: @business
    end
  end

  # DELETE /locations/business_types
  def destroy
    unless @business.destroy
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find locations business type
  def find_business_type
    @business = BusinessType.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params locations
  def business_types_params
    params.permit(
      :name, :description
    )
  end
end
