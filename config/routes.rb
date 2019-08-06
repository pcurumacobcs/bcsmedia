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
      get "user/:id", to: "users#get_user"

      # Location Types
      get "locations/types", to: "locations_types#get_locations_types"
      post "locations/types", to: "locations_types#create"
      put "locations/types", to: "locations_types#update"
      delete "locations/types", to: "locations_types#destroy"

      # Locations
      # CRUD
      get "locations", to: "locations#get_locations"
      post "locations", to: "locations#create"
      put "locations", to: "locations#update"
      delete "locations", to: "locations#destroy"
      # Locations for advertising
      get "locations_ads", to: "locations#get_locations_ads"

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
      get "locations/attention_schedule", to: "location_attention_schedule#get_attention_schedule" # you can pass a body with param :id for search all attention schedule from a single location
      post "locations/attention_schedule", to: "location_attention_schedule#create"
      put "locations/attention_schedule", to: "location_attention_schedule#update"
      delete "locations/attention_schedule", to: "location_attention_schedule#destroy"

      # Location phone numbers
      get "locations/phones", to: "location_phones#get_phone_numbers" # you can pass a body with param :id for search all phone numbers from a single location
      post "locations/phones", to: "location_phones#create"
      put "locations/phones", to: "location_phones#update"
      delete "locations/phones", to: "location_phones#destroy"

      # Location images
      get "locations/images", to: "location_images#get_images" # you can pass a body with param :id for search all images from a single location
      post "locations/images", to: "location_images#create"
      put "locations/images", to: "location_images#update"
      delete "locations/images", to: "location_images#destroy"

      # Screens Brands
      get "screens/brands", to: "screen_brands#get_screen_brands"
      post "screens/brands", to: "screen_brands#create"
      put "screens/brands", to: "screen_brands#update"
      delete "screens/brands", to: "screen_brands#destroy"

      # Screens Types
      get "screens/types", to: "screen_types#get_screen_types"
      post "screens/types", to: "screen_types#create"
      put "screens/types", to: "screen_types#update"
      delete "screens/types", to: "screen_types#destroy"

      # Screens
      get "screens", to: "screens#get_screens" # you can pass a body with param :location_id for search all screens from a single location
      post "screens", to: "screens#create"
      put "screens", to: "screens#update"
      delete "screens", to: "screens#destroy"

      # Screens Installations
      get "screens/installations", to: "screen_installations#get_screen_installations" # you can pass a body with param :screen_id for search all installations from a single screen
      post "screens/installations", to: "screen_installations#create"
      put "screens/installations", to: "screen_installations#update"
      delete "screens/installations", to: "screen_installations#destroy"

      # Screens Place Installations
      get "screens/place/installations", to: "place_installations#get_place_installations" # you can pass a body with param :screen_id for search all installations from a single screen
      post "screens/place/installations", to: "place_installations#create"
      put "screens/place/installations", to: "place_installations#update"
      delete "screens/place/installations", to: "place_installations#destroy"

      # Customers
      get "customers", to: "customers#get_customers"
      post "customers", to: "customers#create"
      put "customers", to: "customers#update"
      delete "customers", to: "customers#destroy"
      # Users Customers
      post "users/customers", to: "user_customers#create"
      delete "users/customers", to: "user_customers#destroy"
      # Customers Companies
      post "customers/companies", to: "customer_companies#create"
      delete "customers/companies", to: "customer_companies#destroy"

      # Contact
      get "contacts", to: "contacts#get_contacts"
      post "contacts", to: "contacts#create"
      put "contacts", to: "contacts#update"
      delete "contacts", to: "contacts#destroy"
      # Customers Contacts
      post "customers/contacts", to: "customer_contacts#create"
      delete "customers/contacts", to: "customer_contacts#destroy"

      # Company Industries
      get "companies/industries", to: "company_industries#get_industries"
      post "companies/industries", to: "company_industries#create"
      put "companies/industries", to: "company_industries#update"
      delete "companies/industries", to: "company_industries#destroy"

      # Companies
      get "companies", to: "companies#get_companies"
      post "companies", to: "companies#create"
      put "companies", to: "companies#update"
      delete "companies", to: "companies#destroy"

      # Advertisement
      get "advertisements", to: "advertising#get_advertisements"
      get "advertising", to: "advertising#get_advertising"
      post "advertising", to: "advertising#create"
      put "advertising", to: "advertising#update"
      delete "advertising", to: "advertising#destroy"

      # Advertising Locations
      get "advertising_locations", to: "advertising_locations#get_advertising_locations"
      post "advertising_location", to: "advertising_locations#create"
      put "advertising_location", to: "advertising_locations#update"
      delete "advertising_location", to: "advertising_locations#destroy"
    end
  end
end

# If you want any of this routes, must be in Rails.application.routes.draw do

# resources :users, param: :_username, only: [:create]
