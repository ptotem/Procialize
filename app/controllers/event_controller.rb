class EventController < ApplicationController
  def edit
  end

  def show

    @events = Event.find(params[:id])
  end

  def index



    @event_days = @conference.event_days
    @eves=Array.new

    @events = @event_days.map { |ed| ed.events }.flatten


  end

end
