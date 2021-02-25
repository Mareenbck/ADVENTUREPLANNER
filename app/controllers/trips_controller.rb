class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @trips = policy_scope(Trip)
    if params.dig(:search, :location).present?
      @trips = @trips.where(location: params.dig(:search, :location))
    end
    @markers = @trips.map do |trip|
      {
        lat: trip.start_lat,
        lng: trip.start_long,
        infoWindow: render_to_string(partial: "info_window", locals: { trip: trip }),
        image_url: helpers.asset_url('https://www.designfreelogoonline.com/wp-content/uploads/2018/03/000946-Free-logo-maker-Mountains-Logo-Logo-01.png')
        
      }
    end
  end

  def show
    @trip = Trip.find(params[:id])
    authorize @trip 
    @booking = Booking.new  # <-- You need this now.

    @waypoints = @trip.waypoints
  #   ratings = []
  #   reviews = Review.all
  #   reviews.each do |review|
  #   right_trips = Trip.w
  #     if review.booking_id == @booking.id where e
  #     ratings << review.rating
  #   end
  #   @note = ratings.sum / ratings.length
  # end
end
