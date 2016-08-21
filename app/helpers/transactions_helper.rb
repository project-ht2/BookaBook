module TransactionsHelper
  def current_user_is_borrower(transaction)
    if current_user.id == transaction.borrower_id 
      return true
    else
      return false
    end
  end
  
  def current_user_is_lender(transaction)
    if current_user.id == transaction.book_item.shelf.user.id
      return true
    else
      return false
    end
  end
end
