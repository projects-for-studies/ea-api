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
      resources :adresses, :only => [:create]

      # USER
      get 'user/:id', to: "users#show"
      put 'user/edit/:id', to: "users#update"
      put 'user/address/edit/:id', to: "users#update_address"
      post 'user/profile_picture_upload/:id', to: "users#upload_picture"
      delete 'user/profile_picture_delete/:id', to: "users#delete_picture"
    end
  end
end
