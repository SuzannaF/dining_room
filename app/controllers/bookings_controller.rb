class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    @review = Review.new

    # RETRIEVE THE DATE OF THE EVENT, REFERENT TO THE BOOKING
    @joined_tables = Event.joins(:bookings)
    @joined_tables.where("events.date >= ?", Date.new).each do |f|
      @future_bookings = @bookings.where(event: f)
    end
    @joined_tables.where("events.date < ?", Date.new).each do |f|
      @past_bookings = @bookings.where(event: f)
    end
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
