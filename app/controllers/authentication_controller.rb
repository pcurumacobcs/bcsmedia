class AuthenticationController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_request, except: [:login, :register]

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
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                    username: @user.username }, status: :ok
    else
      render json: { error: "unauthorized" }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def register_params
    params.permit(
      :name, :last_name, :username, :email, :password, :password_confirmation
    )
  end
end
