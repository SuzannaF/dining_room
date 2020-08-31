class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @events = Event.all
    @booking = Booking.new
    @booking_completed = Booking.where(user_id: current_user.id, event_id: @event.id)
  end
end
