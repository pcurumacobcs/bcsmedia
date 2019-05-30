Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "home#index"

  # namespace :api do
  #   namespace :v1 do
  #     resources :users
  #   end
  # end

  resources :users, param: :_username
  # JWT
  post "/auth/login", to: "authentication#login"
  get "/*a", to: "application#not_found"
end
