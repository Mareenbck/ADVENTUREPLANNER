class MessagesController < ApplicationController
  def create
    # @booking = Booking.find(params[:booking_id])
    @chatroom = Chatroom.find(params[:chatroom_id])
    @booking = @chatroom.bookings.find(current_user.id)
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    authorize @message

    if @message.save
      redirect_to booking_path(@booking, anchor:"message-#{@message.id}")
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: 'message', locals: { message: @message })
      )
    else
      render 'bookings/show'
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end







# @chatroom = Chatroom.find(params[:chatroom_id])
# @message = Message.new(message_params)
# authorize @message
# @message.chatroom = @chatroom
# @message.user = current_user
# if @message.save
#   redirect_to chatroom_path(@chatroom)
# else
#   redirect_to 'messages/new_message'
# end