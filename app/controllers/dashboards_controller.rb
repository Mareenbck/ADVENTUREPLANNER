class DashboardsController < ApplicationController

  def show
    @bookings = Booking.where(user: current_user)
    authorize current_user
  end
end
