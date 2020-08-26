class BookingsController < ApplicationController
  def index
    @bookings = Bookings.all
  end

  def create
    # Not sure if we have to do something about reviews later
    @event = Event.find(params[:event_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.event = @event

    if @booking.save
      redirect_to event_path(@event)
      flash[:notice] = "Booking created. An email has been sent to #{@booking.user.email}"
    else
      render "event/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:number_people)
  end
end
