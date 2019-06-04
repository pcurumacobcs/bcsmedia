class Api::V1::UserCustomersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]
  before_action :authorize_request
  # find
  before_action :find_user_customer, :only => [:destroy]

  # POST /users/customers
  def create
    @user_customer = UserCustomer.new(user_customer_params)

    if @user_customer.save
      render json: @user_customer, status: :created
    end
  end

  # DELETE /users/customers
  def destroy
    unless @user_customer.destroy
      render json: { errors: @user_customer.errors.full_messages },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find user customer
  def find_user_customer
    @user_customer = UserCustomer.where(user_id: params[:user_id], customer_id: params[:customer_id]).first
    if @user_customer.nil?
      resource_not_found
    end
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params user customer
  def user_customer_params
    params.permit(
      :user_id,
      :customer_id,
    )
  end
end
