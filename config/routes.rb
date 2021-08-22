Rails.application.routes.draw do
  resources :auction_winners
  resources :products_by_auctions
  resources :auctions
  resources :status_auctions
  resources :products
  resources :users
  resources :adresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
