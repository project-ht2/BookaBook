Rails.application.routes.draw do

  post 'user_relationship/create'
  post 'user_relationship/destroy'

  resource :cart, only: [:show]
  resources :transactions, only: [:create, :update, :destroy]
  resources :books

  get 'book_reviews/create'
  get 'goodreads/:goodreads_id' => 'books#show_goodreads'

  resources :books
  resources :book_reviews
  resources :book_items
  resources :shelves
  
  resources :messages, only: [:create, :destroy]
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'registrations' }
  
  # Route to search for book
  get 'book/search' => 'books#search'
  
  # Create book_item from goodreads
  post 'book_item/create_from_goodreads' => 'book_items#create_from_goodreads'
  get 'home/index'
  root 'home#index'
  resources :shelves
  resources :users do 
  	resources :shelves
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
