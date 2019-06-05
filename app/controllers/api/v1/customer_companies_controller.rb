class Api::V1::CustomerCompaniesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]
  before_action :authorize_request
  # find
  before_action :find_customer_company, :only => [:destroy]

  # POST /customers/companies
  def create
    @customer_company = CustomerCompany.new(customer_company_params)

    if @customer_company.save
      render json: @customer_company, status: :created
    end
  end

  # DELETE /customers/companies
  def destroy
    unless @customer_company.destroy
      render json: { errors: @customer_company.errors.full_messages },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find locations companies
  def find_customer_company
    @customer_company = CustomerCompany.where(customer_id: params[:customer_id], company_id: params[:company_id]).first
    if @customer_company.nil?
      resource_not_found
    end
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params locations companies
  def customer_company_params
    params.permit(
      :customer_id,
      :company_id,
    )
  end
end
