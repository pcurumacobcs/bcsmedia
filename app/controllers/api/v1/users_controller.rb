class Api::V1::UsersController < ApplicationController

  # GET /users
  def get_users
    @users = User.all

    # render json: @users
    render json: { 'data': @users, 'status': 1 }
  end
end
