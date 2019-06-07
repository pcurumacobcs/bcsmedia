class Api::V1::ScreenBrandsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find screens brands
  before_action :find_screen_brand, :only => [:update, :destroy]

  # GET /screens/brands
  def get_screen_brands
    @screen_brands = ScreenBrand.all

    if !@screen_brands.any?
      resource_not_found
    else
      render json: { 'data': @screen_brands, 'status': 1 }
    end
  end

  # POST /screens/brands
  def create
    @screen_brand = ScreenBrand.new(screen_brands_params)

    if @screen_brand.save
      render json: @screen_brand, status: :created
    end
  end

  # PUT /screens/brands
  def update
    unless @screen_brand.update(screen_brands_params)
      render json: { errors: @screen_brand.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      render json: @screen_brand
    end
  end

  # DELETE /screens/brands
  def destroy
    unless @screen_brand.destroy
      render json: { errors: @screen_brand.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find screens brand
  def find_screen_brand
    @screen_brand = ScreenBrand.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params screens brand
  def screen_brands_params
    params.permit(
      :name
    )
  end
end
