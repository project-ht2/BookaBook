class MessagesController < ApplicationController
  
  def create
    @message = Message.new(message_params)
    
    if @message.save!
      flash[:success] = "Message sent."
    else
      flash[:error] = "Can't send message."
    end
    
    redirect_to :back
  end

  def destroy
    @message = Message.find(params[:id])
    
    if @message.destroy
      flash[:success] = "Message removed."
    else
      flash[:error] = "Can not remove message."
    end
    
    redirect_to :back
  end
  
  
  
  private
    def message_params
      params.require(:message).permit(:sender_id, :receiver_id, :body)
    end
end
