class Api::V1::OperatorsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find locations
  before_action :find_operator, :only => [:update, :destroy]

  # GET /locations/operators
  def get_operators
    @operators = Operator.all

    if !@operators.any?
      resource_not_found
    else
      render json: { 'data': @operators, 'status': 1 }
    end
  end

  # POST /locations/operators
  def create
    @operator = Operator.new(operators_params)

    if @operator.save
      render json: @operator, status: :created
    end
  end

  # PUT /locations/operators
  def update
    unless @operator.update(operators_params)
      render json: { errors: @operator.errors.full_messages },
             status: :unprocessable_entity
    else
      render json: @operator
    end
  end

  # DELETE /locations/operators
  def destroy
    unless @operator.destroy
      render json: { errors: @operator.errors.full_messages },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find locations operator
  def find_operator
    @operator = Operator.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params locations
  def operators_params
    params.permit(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :position,
      :description,
      :type_operator,
    )
  end
end
