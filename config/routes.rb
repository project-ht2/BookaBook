Rails.application.routes.draw do

  resource :cart, only: [:show]
  resources :transactions, only: [:create, :update, :destroy]
  resources :books

  get 'book_reviews/create'

  resources :books do
    resources :book_reviews
  end
  resources :book_items
  resources :shelves
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
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
