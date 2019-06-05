class Api::V1::CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find customer
  before_action :find_customer, :only => [:update, :destroy]

  # GET /customers
  def get_customers
    @customers = Customer.all

    if !@customers.any?
      resource_not_found
    else
      render json: { 'data': @customers, 'status': 1 }
    end
  end

  # POST /customers
  def create
    @customer = Customer.new(customers_params)

    if @customer.save
      render json: @customer, status: :created
    end
  end

  # PUT /customers
  def update
    unless @customer.update(customers_params)
      render json: { errors: @customer.errors.full_messages },
             status: :unprocessable_entity
    else
      render json: @customer
    end
  end

  # DELETE /customers
  def destroy
    unless @customer.destroy
      render json: { errors: @customer.errors.full_messages },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find customer
  def find_customer
    @customer = Customer.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params custome
  def customers_params
    params.permit(
      :name,
      :tradename,
      :address,
      :phone_number,
      :nit,
      :customer_type,
      :status,
    )
  end
end
