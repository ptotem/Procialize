class EventController < ApplicationController
  def edit
  end

  def show

    @event = Event.find(params[:id])

  end

  def show_page

    @event = Event.find(params[:id])

  end

  def index



    @event_days = @conference.event_days
    @locations = @conference.locations


    @events = @event_days.map { |ed| ed.events }.flatten
    @event_locations=@events.map{ |ev| ev.event_locations}.flatten



  end

end
