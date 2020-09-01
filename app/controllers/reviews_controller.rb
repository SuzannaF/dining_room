class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking

    if @review.save
      redirect_to_booking_path(@booking)
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to_booking_path(@review.booking)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to_booking_path(@review.booking)

  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
