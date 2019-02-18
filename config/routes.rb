Rails.application.routes.draw do
  # get 'reviews/index'
  # get 'reviews/show'
  # get 'reviews/new'
  # get 'reviews/create'
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
  # resources :listings, only [:index]
  root to: 'listings#index'

 devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

# devise_scope :user do
#   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
#   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end

  resources :user, only: [ :new, :create ]
  resources :listings, except: [ :edit, :update, :destroy ] do
    resources :bookings, except: [ :destroy ] do
      resources :reviews, except: [ :edit, :update, :destroy ]
    end
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

# POST   /listings/:listing_id/bookings(.:format)                                                 bookings#create

