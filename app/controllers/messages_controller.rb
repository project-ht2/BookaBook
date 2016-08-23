class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    
    if @message.save!
      flash[:success] = "Một tín nhắn đã gửi."
    else
      flash[:error] = "Lỗi khi gửi tin."
    end
    
    redirect_to :back
  end

  def destroy
    @message = Message.find(params[:id])
    
    if @message.destroy
      flash[:success] = "Tin nhắn đã được xoá."
    else
      flash[:error] = "Lỗi khi xoá tin."
    end
    
    redirect_to :back
  end
  
  private
    def message_params
      params.require(:message).permit(:sender_id, :receiver_id, :body)
    end
end
