class DashboardController < ApplicationController

  def show
    @bookings = Booking.where(user: current_user)
    @review = Review.new
    authorize current_user
  end
end
