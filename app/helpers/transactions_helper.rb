module TransactionsHelper
  def current_user_is_borrower(transaction)
    if current_user.id == transaction.borrower_id 
      return true
    else
      return false
    end
  end
end
