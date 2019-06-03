class Api::V1::UsersController < ApplicationController

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
end
