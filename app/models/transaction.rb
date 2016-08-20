class Transaction < ApplicationRecord
  belongs_to :borrower, class_name: "User"
  belongs_to :book_item, class_name: "BookItem"
  belongs_to :transaction_status
  
  validates :quantity, presence: true, numericality: { 
    only_integer: true, 
    greater_than: 0}
  
  validates_presence_of :borrower, :book_item
  validate :quantity_not_greater_than_available_count
  
  before_validation :set_available_count
  before_create :decrease_available_count
  before_destroy :increase_available_count

  private
    
    def quantity_not_greater_than_available_count
      if self.quantity > self.book_item.available_count
        # "Ban khong the muon hon so sach hien co"
        return false
      else
        return true
      end
    end
    
    def set_available_count
      if self.book_item.available_count.nil?
        self.book_item.available_count = self.book_item.quantity
      end
    end
    
    def decrease_available_count
      self.book_item.available_count = self.book_item.available_count - self.quantity
      self.book_item.save!
    end
    
    def increase_available_count
      self.book_item.available_count = self.book_item.available_count + self.quantity 
      self.book_item.save!
    end
end
