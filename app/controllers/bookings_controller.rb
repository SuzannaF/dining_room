class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    @review = Review.new

    # This logic will allows us to present the bookings in different sections
    # depending on the date of the event
    @future_bookings = current_user.bookings.select { |booking| booking.event.date >= Time.now }
    @past_bookings = current_user.bookings.select { |booking| booking.event.date < Time.now }
    console
  end

  def create
    # Not sure if we have to do something about reviews later
    @event = Event.find(params[:event_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.event = @event

    if @booking.save
      redirect_to bookings_path
      flash[:notice] = "Booking created. An email has been sent to #{@booking.user.email}"
    else
      render "event/show"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bookings_path

  end

  private

  def booking_params
    params.require(:booking).permit(:number_people)
  end
end
