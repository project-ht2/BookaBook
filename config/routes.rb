Rails.application.routes.draw do

  get 'transaction_reviews/create'

  post 'user_relationship/create'
  post 'user_relationship/destroy'

  resource :cart, only: [:show]
  resources :transactions, only: [:create, :update, :destroy]
  resources :books
  resources :user_categories

  get 'book_reviews/create'
  get 'goodreads/:goodreads_id' => 'books#show_goodreads'

  resources :books
  resources :book_reviews do
    put "like", to: "book_reviews#upvote"
    put "dislike", to: "book_reviews#downvote"
  end
  
  resources :book_items
  resources :shelves
  
  resources :messages, only: [:create, :destroy]
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'registrations' }
  
  # Route for wishlist
  resources :wishlist, only: [:create, :destroy]
  
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
  post 'transaction_reviews' => 'transaction_reviews#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
