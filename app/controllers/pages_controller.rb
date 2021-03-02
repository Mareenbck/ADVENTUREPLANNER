class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @trips = policy_scope(Trip).select("trips.*, avg(reviews.rating) as average_rating").left_joins(bookings: :review).group("trips.id")
    @min_distance = @trips.order('kilometers ASC').first.kilometers.floor
    @max_distance = @trips.order('kilometers ASC').last.kilometers.ceil
    @trips = @trips.where(difficulty: params[:difficulty]) if params.dig(:difficulty).present?
    @trips = @trips.where(["kilometers >= ? and kilometers <= ?", params[:kilometers].split(',')[0], params[:kilometers].split(',')[1]]) if params.dig(:kilometers).present?
  end
end
