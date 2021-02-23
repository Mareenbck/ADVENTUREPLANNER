class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @trips = policy_scope(Trip)
  end

  def show
    @trip = Trip.find(params[:id])
    authorize @trip 
  end
end
