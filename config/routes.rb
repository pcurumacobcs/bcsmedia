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

      # Business Types
      get "locations/business_types", to: "business_types#get_business_types"
      post "locations/business_types", to: "business_types#create"
      put "locations/business_types", to: "business_types#update"
      delete "locations/business_types", to: "business_types#destroy"

      # Nearby Place Tags
      get "locations/nearby_place_tag", to: "nearby_place_tag#get_nearby_place_tag"
      post "locations/nearby_place_tag", to: "nearby_place_tag#create"
      put "locations/nearby_place_tag", to: "nearby_place_tag#update"
      delete "locations/nearby_place_tag", to: "nearby_place_tag#destroy"

      # Operators
      get "locations/operators", to: "operators#get_operators"
      post "locations/operators", to: "operators#create"
      put "locations/operators", to: "operators#update"
      delete "locations/operators", to: "operators#destroy"
    end
  end
end

# If you want any of this routes, must be in Rails.application.routes.draw do

# resources :users, param: :_username, only: [:create]
