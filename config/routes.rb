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
    end
  end
end

# If you want any of this routes, must be in Rails.application.routes.draw do

# resources :users, param: :_username, only: [:create]
