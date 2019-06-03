class Api::V1::ScreenTypesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find screens types
  before_action :find_screen_type, :only => [:update, :destroy]

  # GET /screens/types
  def get_screen_types
    @screen_types = ScreenType.all

    if !@screen_types.any?
      resource_not_found
    else
      render json: { 'data': @screen_types, 'status': 1 }
    end
  end

  # POST /screens/types
  def create
    @screen_type = ScreenType.new(screen_types_params)

    if @screen_type.save
      render json: @screen_type, status: :created
    end
  end

  # PUT /screens/types
  def update
    unless @screen_type.update(screen_types_params)
      render json: { errors: @screen_type.errors.full_messages },
             status: :unprocessable_entity
    else
      render json: @screen_type
    end
  end

  # DELETE /screens/types
  def destroy
    unless @screen_type.destroy
      render json: { errors: @screen_type.errors.full_messages },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find screens types
  def find_screen_type
    @screen_type = ScreenType.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params screens types
  def screen_types_params
    params.permit(
      :name
    )
  end
end
