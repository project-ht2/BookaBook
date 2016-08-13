Rails.application.routes.draw do

  get 'users/index'

  resources :books
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  get 'home/index'
  root 'home#index'
  resources :shelves
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
