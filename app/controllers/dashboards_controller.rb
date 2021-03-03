class DashboardsController < ApplicationController

  def show

    @review = Review.new
    @bookings = current_user.bookings


    @last_bookings = @bookings.where('DATE(begin_date) < ?', Date.today)
    @upcoming_bookings = @bookings.where('DATE(begin_date) >= ?', Date.today)
    # if params[:bookings] == "last_bookings"
    #   @bookings = @bookings.where('DATE(begin_date) < ?', Date.today)
    # else
    #   @bookings = @bookings.where('DATE(begin_date) >= ?', Date.today)
    # end

    authorize current_user
  end
end
