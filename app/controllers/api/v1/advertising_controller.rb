class Api::V1::AdvertisingController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find advertising
  before_action :find_advertising, :only => [:update, :get_advertising, :destroy]

  # GET /advertisements
  def get_advertisements
    @advertisements = Advertisement.all

    if !@advertisements.any?
      resource_not_found
    else
      render json: { 'data': @advertisements, 'status': 1 }
    end
  end

  # GET /advertising
  def get_advertising
    
    render json: { 'data': @advertising, 'status': 1 }
  end

  # POST /advertising
  def create
    @advertising = Advertisement.new(advertising_params)

    if @advertising.save
      render json: @advertising, status: :created
    end
  end

  # PUT /advertising
  def update
    unless @advertising.update(advertising_params)
      render json: { errors: @advertising.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      render json: @advertising
    end
  end

  # DELETE /advertising
  def destroy
    unless @advertising.destroy
      render json: { errors: @advertising.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find advertising advertising
  def find_advertising
    @advertising = Advertisement.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params advertising
  def advertising_params
    params.permit(
      :customer_id,
      :contact_id,
      :company_id,
      :user_id,
      :status
    )
  end
end
