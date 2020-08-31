class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking

    if @review.save
      redirect_to_booking_path(@booking)
    end
  end

  def new
    @review = review.new
  end

  private

  def review_params
    params.require(:review).permit(:number_people)
  end
end
