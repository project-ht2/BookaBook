class CartsController < ApplicationController
  def show
    @borrower_transactions = Transaction.where(borrower_id: current_user.id)
    @lender_transactions = Transaction.joins(:book_item).merge(BookItem.joins(:shelf).merge(Shelf.where(user_id: current_user.id)))
    @current_user_messages = Message.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end
end
