class CartsController < ApplicationController
  helper_method :load_conversation
  
  def show
    @borrower_transactions = Transaction.where(borrower_id: current_user.id)
    @lender_transactions = Transaction.joins(:book_item).merge(BookItem.joins(:shelf).merge(Shelf.where(user_id: current_user.id)))
    @current_user_messages = Message.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end
  
  def load_conversation(sender_id, receiver_id)
      Message.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)", sender_id, receiver_id, receiver_id, sender_id).order("created_at DESC")
  end
end
