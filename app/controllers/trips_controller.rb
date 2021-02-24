class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @trips = policy_scope(Trip)
    @markers = @trips.map do |trip|
      {
        lat: trip.start_lat,
        lng: trip.start_long
        
      }
    end
  end

  def show
    @trip = Trip.find(params[:id])
    authorize @trip 

    @waypoints = @trip.waypoints

  end
end
