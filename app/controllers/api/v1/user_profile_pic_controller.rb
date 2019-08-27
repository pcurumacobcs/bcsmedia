class Api::V1::UserProfilePicController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find profile_pic
  before_action :find_profile_pic, :only => [:update, :get_profile_pic, :destroy]

  def create
    if params[:file]
      profile_pic = ProfilePic.new(
        :image => params[:file]
      )

      if profile_pic.save!
        render json: { message: 'Resource created', status: 1 }
      end
    end
  end
  

  private

  def profile_pic_params
    params.permit(:file)
  end
end
