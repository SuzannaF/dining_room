Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'events#index'
  # For bookings I only added create as we are creating an instance
  # inside the show page (like swimming pools)
  resources :events, only: [:index, :show] do
    resources :bookings, only: [:create, :update]
  end

  resources :bookings, only: [:show, :index] do
    resources :reviews, only: [:create, :update]
  end
end

