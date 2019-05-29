class HomeController < ApplicationController
  def index
  end

  def myapi
    render json: {'mensaje': 'Api funcionando'}
  end
end
