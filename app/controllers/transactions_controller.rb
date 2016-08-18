class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(transaction_params)
    
    if @transaction.save!
      flash[:success] = "Yeu cau cua ban da duoc tao."
      
      # Optional: send mail to borrower and lender.
    else
      flash[:error] = "Yeu cau chua thanh cong."
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction = update_attributes(order_item_params)
    flash[:success] = "Yeu cau cua ban da duoc cap nhat."
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
  end
  
  private
    def transaction_params
      params.require(:transaction).permit(:borrower_id, :book_item_id, :quantity)
    end
end
