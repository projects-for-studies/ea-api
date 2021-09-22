require 'api_constraints'
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: { sessions: "sessions" }
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :auction_winners
      resources :products_by_auctions
      resources :auctions
      resources :status_auctions
      resources :products
      resources :adresses

      # GET USER
      get 'user/:id', to: "users#show"
    end
  end
end
