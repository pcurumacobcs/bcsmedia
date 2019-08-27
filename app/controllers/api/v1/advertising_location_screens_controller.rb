class Api::V1::AdvertisingLocationScreensController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create_advertising_location_screens, :update, :destroy]
  before_action :authorize_request
  # find advertising_location_screen
  before_action :find_advertising_location_screen, :only => [:update, :get_advertising_location_screens, :destroy]

  # GET /advertising_location_screens
  def get_advertising_location_screens
    if params[:advertising_id]
      @advertising_location_screens = AdvertisingLocationScreen.where(advertisements_id: params[:advertising_id])
    elsif params[:advertising_locations_id]
      @advertising_location_screens = AdvertisingLocationScreen.where(advertising_locations_id: params[:advertising_locations_id])
    else
      @advertising_location_screens = AdvertisingLocationScreen.all
    end

    if !@advertising_location_screens.any?
      resource_not_found
    else
      render json: { 'data': @advertising_location_screens, 'status': 1 }
    end
  end

  # POST /advertising_location_screens
  def create_advertising_location_screens
    if !params[:locations].nil? and !params[:advertising_id].nil?
      locations = params[:locations]
      advertising_id = params[:advertising_id]

      # loop for locations
      locations.each do |location|
        ad_location = AdvertisingLocation.find_by advertisements_id: advertising_id, locations_id: location[:id]

        if location[:screens].any?
          ad_location_id = ad_location[:id]
          screens = location[:screens]

          screens.each do |screen|
            ad_loc_screen = AdvertisingLocationScreen.find_by advertisements_id: advertising_id, advertising_locations_id: ad_location_id, screen_id: screen[:id]
          
            if !ad_loc_screen.nil?
              # if exist
              if !screen[:selected]
                ad_loc_screen.destroy
              end
            else
              # if don't exist, create a mew register
              # only if screen is selected
              if screen[:selected]
                new_ad_loc_screen = AdvertisingLocationScreen.new(
                  :advertisements_id => advertising_id,
                  :advertising_locations_id => ad_location[:id],
                  :screen_id => screen[:id]
                )
                new_ad_loc_screen.save
              end
            end # end ad_loc_screen
          end # end location[:screens].each
        else
          puts "No hay screens"
        end # end location[:screens].nil?
      end # end locations.each

      # response structure
      locations = []
      screens_landscape = 0
      screens_portrait = 0

      ad_screens = AdvertisingLocationScreen.where(advertisements_id: advertising_id).as_json
      ad_screens.each do |screen|
        advertising_location = AdvertisingLocation.find screen["advertising_locations_id"]
        screen["location"] = Location.find advertising_location[:locations_id]
        locations.push(screen["location"])
      
        screen["screen"] = Screen.find screen["screen_id"]
        if screen["screen"].orientation == 'Landscape'
          screens_landscape = screens_landscape + 1
        else
          screens_portrait = screens_portrait + 1
        end
      end
      render json: {
        screens: ad_screens,
        message: 'success',
        locations: locations.uniq.count,
        screens_landscape: screens_landscape,
        screens_portrait: screens_portrait,
        status: 1
      }, status: 200
    else
      render json: { errors: 'Some Data is missing...', status: 0 }, status: :unprocessable_entity
    end
  end

  # DELETE /advertising_location
  def destroy
    unless @advertising_location.destroy
      render json: { errors: @advertising_location.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find advertising_location_screen
  def find_advertising_location_screen
    @advertising_location_screen = AdvertisingLocationScreen.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params advertising_location_screen
  def advertising_location_screen_params
    params.permit(
      :advertisements_id,
      :advertising_locations_id,
      :screen_id,
      :status
    )
  end
end
