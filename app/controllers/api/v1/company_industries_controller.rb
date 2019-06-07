class Api::V1::CompanyIndustriesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find industry
  before_action :find_compnay_industry, :only => [:update, :destroy]

  # GET /company/industries
  def get_industries
    @industries = CompanyIndustry.all

    if !@industries.any?
      resource_not_found
    else
      render json: { 'data': @industries, 'status': 1 }
    end
  end

  # POST /company/industries
  def create
    @industry = CompanyIndustry.new(industries_params)

    if @industry.save
      render json: @industry, status: :created
    end
  end

  # PUT /company/industries
  def update
    unless @industry.update(industries_params)
      render json: { errors: @industry.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      render json: @industry
    end
  end

  # DELETE /company/industries
  def destroy
    unless @industry.destroy
      render json: { errors: @industry.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find industry
  def find_compnay_industry
    @industry = CompanyIndustry.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params custome
  def industries_params
    params.permit(
      :name,
    )
  end
end
