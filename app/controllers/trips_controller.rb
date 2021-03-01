class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    
    @trips = policy_scope(Trip).select("trips.*, avg(reviews.rating) as average_rating").left_joins(bookings: :review).group("trips.id")
    @min_distance = @trips.order('kilometers ASC').first.kilometers.floor
    @max_distance = @trips.order('kilometers ASC').last.kilometers.ceil
    @trips = @trips.where(difficulty: params[:difficulty]) if params.dig(:difficulty).present?
    @trips = @trips.where(["kilometers >= ? and kilometers <= ?", params[:kilometers].split(',')[0], params[:kilometers].split(',')[1]]) if params.dig(:kilometers).present?
    
    

    @markers = @trips.map do |trip|
      {
        lat: trip.start_lat,
        lng: trip.start_long,
        infoWindow: render_to_string(partial: "info_window", locals: { trip: trip }),
        image_url: helpers.asset_url('https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Map_marker.svg/512px-Map_marker.svg.png')
        
      }
    end
  end

  def show
    @trip = Trip.find(params[:id])
    authorize @trip 
    @booking = Booking.new  # <-- You need this now.
    @reviews = @trip.reviews
    @ratings = []
    @reviews.each do |r|
      @ratings << r.rating
    end
    @note = (@ratings.sum / @ratings.length).round
    @waypoints = @trip.waypoints

  end

end
