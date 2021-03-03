class FavoritesController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @favorite = Favorite.new
    @favorite.trip = @trip
    @favorite.user = current_user
    @favorite.save
    redirect_to trip_path(@trip)
    # else
    skip_authorization
    # redirect_to root_path
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    # @favorite.trip = @trip
    # @favorite.user = current_user
    @favorite = current_user.favorites.find_by(trip: @trip)
    @favorite.destroy
    redirect_to trip_path(@trip)

    skip_authorization
  end

  def index
    @trips = policy_scope(current_user.favorite_trips).select("trips.*, avg(reviews.rating) as average_rating").left_joins(bookings: :review).group("trips.id")
    # @min_distance = @trips.order('kilometers ASC').first.kilometers.floor
    # @max_distance = @trips.order('kilometers ASC').last.kilometers.ceil
    @trips = @trips.where(difficulty: params[:difficulty]) if params.dig(:difficulty).present?
    @trips = @trips.where(["kilometers >= ? and kilometers <= ?", params[:kilometers].split(',')[0], params[:kilometers].split(',')[1]]) if params.dig(:kilometers).present?
  end
end

