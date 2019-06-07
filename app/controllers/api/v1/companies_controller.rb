class Api::V1::CompaniesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find company
  before_action :find_company, :only => [:update, :destroy]

  # GET /companies
  def get_companies
    @companies = Company.all

    if !@companies.any?
      resource_not_found
    else
      render json: { 'data': @companies, 'status': 1 }
    end
  end

  # POST /companies
  def create
    @company = Company.new(companies_params)

    if @company.save
      render json: @company, status: :created
    end
  end

  # PUT /companies
  def update
    unless @company.update(companies_params)
      render json: { errors: @company.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      render json: @company
    end
  end

  # DELETE /companies
  def destroy
    unless @company.destroy
      render json: { errors: @company.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find company
  def find_company
    @company = Company.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params company
  def companies_params
    params.permit(
      :company_industry_id,
      :name,
      :address,
      :phone_number,
      :web_site,
    )
  end
end
