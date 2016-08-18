class Transaction < ApplicationRecord
  belongs_to :borrower, class_name: "User"
  belongs_to :book_item, class_name: "BookItem"
  belongs_to :transaction_status
  
  validates :quantity, presence: true, numericality: { 
    only_integer: true, 
    greater_than: 0}
  
  validates_presence_of :borrower, :book_item
  validate :quantity_not_greater_than_available_count
  
  before_validation :set_transaction_status
  before_save :update_available_count
  
  private
    def set_transaction_status
      # set Transaction_stats to 1 which is "Requested"
      self.transaction_status_id = 1
    end
    
    def quantity_not_greater_than_available_count
      if self.quantity < self.available_count
        flash[:error] = "Ban khong the muon hon so sach hien co"
        return false
      else
        return true
      end
    end
    
    def update_available_count
      if self.book_item.available_count.nil?
        self.book_item.available_count = self.book_item.quantity
      end
      
      self.book_item.available_count = self.book_item.available_count - self.quantity
      self.book_item.save!
      
    end
end
