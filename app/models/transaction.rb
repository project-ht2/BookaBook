class Transaction < ApplicationRecord
  belongs_to :borrower, class_name: "User"
  belongs_to :book_item, class_name: "BookItem"
  belongs_to :transaction_status
  
  before_create :set_transaction_status
  
  private
    def set_transaction_status
      # set Transaction_stats to 1 which is "Requested"
      self.transaction_status_id = 1
    end
    

end
