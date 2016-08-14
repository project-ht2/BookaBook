class BookItem < ApplicationRecord
    belongs_to :users
    belongs_to :shelves 
end
