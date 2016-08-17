class Transaction < ApplicationRecord
  belongs_to :borrower, class_name: "User"
  belongs_to :book_item, class_name: "BookItem"
  belongs_to :transaction_status
  
  validates :quantity, presence: true, numericaltity: { 
    only_integer: true, 
    greater_than: 0, 
    less_than_or_equal_to: self.book_item.available_count }
  
  validates_presence_of :borrower, :book_item
  
  before_create :set_transaction_status
  before_save :update_available_count
  
  private
    def set_transaction_status
      # set Transaction_stats to 1 which is "Requested"
      self.transaction_status_id = 1
    end
    
    def update_available_count
      self.book_item.available_count = self.book_item.available_count - self.quantity
      self.book_item.save!
    end
end
