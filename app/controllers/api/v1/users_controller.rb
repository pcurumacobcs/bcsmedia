class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request

  # GET /users
  def get_users
    @users = User.all

    # render json: @users
    if !@users.any?
      resource_not_found
    else
      render json: { 'data': @users, 'status': 1 }
    end
  end

  # GET /user/:id
  def get_user
    @user = User.find(params[:id])

    render json: { user: @user, status: 1 }
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end
end
