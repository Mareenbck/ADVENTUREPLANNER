class BookingsController < ApplicationController


  def create
    @trip = Trip.find(params[:trip_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.trip = @trip
  #  si mon trip a deja été reservé au meme date, je vais chercher la chatroom de ces booking
    bookings = Booking.where(begin_date: @booking.begin_date, trip_id: @booking.trip_id)
    if bookings != []
      @booking.chatroom = bookings.first.chatroom
    else
      @chatroom = Chatroom.create(name: "#{@booking.trip.name} - On #{@booking.begin_date}")
      @booking.chatroom = @chatroom
    end
  # si mon trip n'a pas été réservé au meme date, je créé un nouveau chatrom et je l'associe à booking
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render '/trips/:id'
    end
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.user = current_user
    @booking.trip = @trip
    @booking.destroy
    redirect_to dashboard_path
  end

  def show
    @booking = Booking.find(params[:id])
    bookings = Booking.where(begin_date: @booking.begin_date, trip_id: @booking.trip_id)
    @booking_users = bookings.map { |booking| booking.user }
    @review = Review.new
    authorize @booking

    # @markers = @booking.trip.each do |trip|
    #   {
    #     lat: trip.start_lat,
    #     lng: trip.start_long,
    #     infoWindow: render_to_string(partial: "info_window", locals: { trip: trip }),
    #     image_url: helpers.asset_url('https://www.designfreelogoonline.com/wp-content/uploads/2018/03/000946-Free-logo-maker-Mountains-Logo-Logo-01.png')
    #   }
    # end
  end

  private

  def booking_params
    params.require(:booking).permit(:begin_date, :end_date, :user_status)
  end
end
