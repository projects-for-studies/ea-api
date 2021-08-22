require 'api_constraints'
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :auction_winners
      resources :products_by_auctions
      resources :auctions
      resources :status_auctions
      resources :products
      resources :users
      resources :adresses
    end
  end
end
