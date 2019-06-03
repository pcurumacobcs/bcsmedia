class Api::V1::LocationAttentionScheduleController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find
  before_action :find_attention_schedule, :only => [:update, :destroy]

  # GET /locations/attention_schedule
  def get_attention_schedule
    if params[:id].present?
      @attention_schedules = LocationAttentionSchedule.where(location_id: params[:id])
    else
      @attention_schedules = LocationAttentionSchedule.all
    end

    # Return attention schedule
    if !@attention_schedules.any?
      resource_not_found
    else
      render json: { 'data': @attention_schedules, 'status': 1 }
    end
  end

  # POST /locations/attention_schedule
  def create
    @attention_schedule = LocationAttentionSchedule.new(attention_schedule_params)

    if @attention_schedule.save
      render json: @attention_schedule, status: :created
    end
  end

  # PUT /locations/attention_schedule
  def update
    unless @attention_schedule.update(attention_schedule_params)
      render json: { errors: @attention_schedule.errors.full_messages },
             status: :unprocessable_entity
    else
      render json: @attention_schedule
    end
  end

  # DELETE /locations/attention_schedule
  def destroy
    unless @attention_schedule.destroy
      render json: { errors: @attention_schedule.errors.full_messages },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find locations
  def find_attention_schedule
    @attention_schedule = LocationAttentionSchedule.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params locations
  def attention_schedule_params
    params.permit(
      :location_id,
      :day,
      :start_hour,
      :end_hour,
    )
  end
end
