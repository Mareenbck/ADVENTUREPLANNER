class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    
    @trips = policy_scope(Trip).select("trips.*, avg(reviews.rating) as average_rating").left_joins(bookings: :review).group("trips.id")

    if params.dig(:search, :location).present?
      @trips = @trips.where(location: params.dig(:search, :location))
    end
    
    if params.dig(:difficulty).present?
      @trips = @trips.where(difficulty: params[:difficulty])
    end

    if params.dig(:kilometers).present?
      @trips = @trips.where(kilometers: params[:kilometers])
    end

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
