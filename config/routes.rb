Rails.application.routes.draw do
  get 'wishlist_items/index'
  get 'wishlist_items/new'
  get 'wishlist_items/create'
  get 'wishlist_items/destroy'

  resources :bookings, only: [ :index, :show ]
  devise_for :users
  root to: 'listings#index'

  resources :user, only: [ :new, :create ]
  resources :listings, except: [ :edit, :update, :destroy ] do
    resources :bookings, except: [ :destroy ] do
      resources :reviews, except: [ :edit, :update, :destroy ]
    end
  end
end
