class CartsController < ApplicationController
  def show
    @borrow_transactions = Transaction.where(borrower_id: current_user.id)
    
    
    current_user.shelves.each do |shelf|
      shelf.book_items.each do |book_item|
        t = Transaction.where(book_item_id: book_item.id)
        if @lend_transactions.nil?
          @lend_transactions = t
        else
          @lend_transactions << t
        end
      end
    end
  end
end
