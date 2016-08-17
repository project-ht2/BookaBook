class BookItem < ApplicationRecord
    belongs_to :book
    belongs_to :shelf 
    has_many :transactions 
end
