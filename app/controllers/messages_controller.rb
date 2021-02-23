class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    authorize @message
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to chatroom_path(@chatroom)
    else
      redirect_to 'messages/new_message'
  end
end
