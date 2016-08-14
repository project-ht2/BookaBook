Rails.application.routes.draw do

  resources :books
  resources :book_items
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  # Route to search for book
  post 'book/search' => 'books#search'
  
  get 'home/index'
  root 'home#index'
  resources :users do 
  	resources :shelves
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
