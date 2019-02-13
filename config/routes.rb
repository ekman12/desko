Rails.application.routes.draw do
  resources :bookings, only: [ :index, :show ]

  # get 'bookings/index'
  # get 'bookings/show'
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/edit'
  # get 'bookings/update'

  # get 'listings/index'
  # get 'listings/show'
  # get 'listings/new'
  # get 'listings/create'
  devise_for :users
  root to: 'pages#home'
  # resources :user, only: [ :new, :create ] do
    resources :listings, except: [ :edit, :update, :destroy ] do
      resources :bookings, except: [ :destroy ]
    end

  #       resources :reviews, only: [ :show, :index, :new, :create ]
  #     end
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# root 'cocktails#index'
#   resources :doses, only: [:destroy]
#   resources :cocktails, except: [:edit, :update ] do
#     resources :doses, only: [:new, :create, :destroy]
#   end


# IMPORTANT DEVISE MODEL
