Rails.application.routes.draw do
  get 'events/home'
  devise_for :users
  root to: 'events#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
