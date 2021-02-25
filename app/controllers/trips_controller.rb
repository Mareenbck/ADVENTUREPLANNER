class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    
    @trips = policy_scope(Trip).select("trips.*, avg(reviews.rating) as average_rating").left_joins(bookings: :review).group("trips.id")

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

    @waypoints = @trip.waypoints

  end

end
