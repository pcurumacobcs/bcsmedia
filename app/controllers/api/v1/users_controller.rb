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
end
