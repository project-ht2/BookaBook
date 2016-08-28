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
  before_save :change_available_count

  def next_transaction_statuses
    # 1 Đang yêu cầu
    # 2 Đồng ý
    # 3 Đã nhận sách
    # 4 Trả sách
    # 5 Đã trả sách
    # 6 Huỷ
    case self.transaction_status.id
    when 1
      return {"borrower": [6],"lender": [2, 6]}
    when 2
      return {"borrower": [3], "lender": [5]}
    when 3
      return {"borrower": [4], "lender": [5]}
    when 4
      return {"borrower": [], "lender": [5]}
    else
      return {}
    end
  end

  def lender
    self.book_item.shelf.user
  end

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
    
    def change_available_count
      # Decrease available count when transaction status la 2. Dong y
      if self.transaction_status_id == 2
        self.book_item.available_count = self.book_item.available_count - self.quantity 
        self.book_item.save!
      end
      
      # Increase availabel count when transaction status la 5. Da tra sach
      if self.transaction_status_id == 5
        self.book_item.available_count = self.book_item.available_count + self.quantity
        self.book_item.save!
      end
    end
end
