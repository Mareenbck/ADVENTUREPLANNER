class MessagesController < ApplicationController
  def create
    # @booking = Booking.find(params[:booking_id])
    @chatroom = Chatroom.find(params[:chatroom_id])
    @booking = @chatroom.bookings.find_by(user: current_user)
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    authorize @message

    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        {
          success: true,
          message: @message.content,
          author: @message.user.first_name,
          message_id: @message.id,
          user_photo: @message.user.photo.key,
          user_id: current_user.id
        }
      )

      # respond_to do |format|
      #   format.html do
      #     # ChatroomChannel.broadcast_to(
      #     #   @chatroom,
      #     #   render_to_string(partial: 'message', locals: { message: @message })
      #     # )
      #   end
      #   format.json do
      #     render json: {
      #       success: true,
      #       message: @message.content,
      #       author: @message.user.first_name,
      #       message_id: @message.id,
      #       user_photo: @message.user.photo.key
      #     }
      #   end
      # end
      # redirect_to booking_path(@booking, anchor:"message-#{@message.id}")
    else
      respond_to do |format|
        format.html { render 'bookings/show' }
        format.json { render json: { success: false } }
      end
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
