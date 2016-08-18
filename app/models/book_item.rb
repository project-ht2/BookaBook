class BookItem < ApplicationRecord
    belongs_to :book
    belongs_to :shelf 
    has_many :transactions 
    
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
