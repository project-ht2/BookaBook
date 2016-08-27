class TransactionsController < ApplicationController

  def create
    @transaction = Transaction.new(transaction_params)
    
    # When created, it is at status of "Requested"
    @transaction.transaction_status_id = 1
    if @transaction.save!
      flash[:success] = "Request has been sent."
      
      # Optional: send mail to borrower and lender.
    else
      flash[:error] = "Mission impossible."
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction.update(transaction_params)
    flash[:success] = "Request updated."
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
  end
  
  private
    def transaction_params
      params.require(:transaction).permit(:borrower_id, :book_item_id, :quantity, :transaction_status_id)
    end
end
