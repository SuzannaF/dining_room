class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @events = Event.all
    @booking = Booking.new
  end
end
