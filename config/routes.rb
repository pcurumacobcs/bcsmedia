Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Home view for backend
  root to: "home#index"

  # JWT
  # Register
  post "/auth/register", to: "authentication#register"
  # Login...
  post "/auth/login", to: "authentication#login"
  # get "/*a", to: "application#not_found"
  # end JWT

  namespace :api do
    namespace :v1 do
      # Users
      get "users", to: "users#get_users"

      # Location Types
      get "locations/types", to: "locations_types#get_locations_types"
      post "locations/types", to: "locations_types#create"
      put "locations/types", to: "locations_types#update"
      delete "locations/types", to: "locations_types#destroy"

      # Locations
      get "locations", to: "locations#get_locations"
      post "locations", to: "locations#create"
      put "locations", to: "locations#update"
      delete "locations", to: "locations#destroy"

      # Business Types
      get "business_types", to: "business_types#get_business_types"
      post "business_types", to: "business_types#create"
      put "business_types", to: "business_types#update"
      delete "business_types", to: "business_types#destroy"
      # Location Business Types
      post "locations/business_type", to: "location_business_types#create"
      delete "locations/business_type", to: "location_business_types#destroy"

      # Nearby Place Tags
      get "nearby_place_tag", to: "nearby_place_tag#get_nearby_place_tag"
      post "nearby_place_tag", to: "nearby_place_tag#create"
      put "nearby_place_tag", to: "nearby_place_tag#update"
      delete "nearby_place_tag", to: "nearby_place_tag#destroy"
      # Location Nearby Place Tags
      post "locations/nearby_place_tag", to: "location_nearby_place_tags#create"
      delete "locations/nearby_place_tag", to: "location_nearby_place_tags#destroy"

      # Operators
      get "operators", to: "operators#get_operators"
      post "operators", to: "operators#create"
      put "operators", to: "operators#update"
      delete "operators", to: "operators#destroy"
      # Location Nearby Place Tags
      post "locations/operators", to: "location_operators#create"
      delete "locations/operators", to: "location_operators#destroy"

      # Installation Dates
      get "locations/installation", to: "location_installation_dates#get_locations_installation" # you can pass a body with param :id for search all installations from a single location
      post "locations/installation", to: "location_installation_dates#create"
      put "locations/installation", to: "location_installation_dates#update"
      delete "locations/installation", to: "location_installation_dates#destroy"

      # Location attention Schedule
      #
      get "locations/attention_schedule", to: "location_attention_schedule#get_attention_schedule" # you can pass a body with param :id for search all installations from a single location
      post "locations/attention_schedule", to: "location_attention_schedule#create"
      put "locations/attention_schedule", to: "location_attention_schedule#update"
      delete "locations/attention_schedule", to: "location_attention_schedule#destroy"
    end
  end
end

# If you want any of this routes, must be in Rails.application.routes.draw do

# resources :users, param: :_username, only: [:create]
