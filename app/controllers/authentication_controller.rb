class AuthenticationController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_request, except: [:login, :register]

  before_action :find_user, :only => [:login]

  # POST /auth/register
  def register
    @user = User.new(register_params)
    if @user.save
      role_user = RoleUser.new(
        user_id: @user.id,
        role_id: 1, # set default Admin
      )
      role_user.save

      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages, status: 0 }, status: :unprocessable_entity
    end
  end

  # POST /auth/login
  def login
    if @user && @user.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 8760.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"), username: @user.username, email: @user.email, status: 1 }, status: :ok
    else
      render json: { messages: ["Invalid Email, Username or Password"], status: 0 }, status: :unauthorized
      # render json: { error: "unauthorized", status: 0 }, status: :unauthorized
    end
  end

  private

  def find_user
    @user = User.find_by_email(params[:username])
    if @user.nil?
      @user = User.where(username: params[:username]).first
    end
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  def login_params
    params.permit(:username, :password)
  end

  def register_params
    params.permit(
      :name, :last_name, :username, :email, :password, :password_confirmation
    )
  end
end
