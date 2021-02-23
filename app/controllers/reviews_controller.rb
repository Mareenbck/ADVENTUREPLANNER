class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    authorize @review
    @review.user = current_user
    @review.booking = @booking
    if @review.save 
      redirect_to booking_path(@booking)
    else
      render 'reviews/new_review'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :landscape_rating, :signage_rating, :difficulty_rating)
  end
end

