class EventsController < ApplicationController
  def index
    @events = Event.all

    # This logic will allows us to only display the future events on the carousel
    @future_events = @events.select { |event| event.date >= Time.now }
  end

  def show
    @event = Event.find(params[:id])
    @events = Event.all
    @booking = Booking.new
    @booking_completed = Booking.where(user_id: current_user.id, event_id: @event.id)
    @future_events = @events.select { |event| event.date >= Time.now }
  end
end
