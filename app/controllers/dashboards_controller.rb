class DashboardsController < ApplicationController

  def show
    @bookings = current_user.bookings
    if params[:bookings] == "last_bookings"
      @bookings = @bookings.where('DATE(begin_date) < ?', Date.today)
    else
      @bookings = @bookings.where('DATE(begin_date) >= ?', Date.today)
    end

    authorize current_user
  end
end
