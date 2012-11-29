class EventController < ApplicationController
  def edit
  end

  def show

    @events = Event.find(params[:id])
  end

  def index

    @event_days = @conference.event_days
    @eves=Array.new
    #@event_days.each do |ev|
    #  @eves<<ev.name
    #  #@e = @eves.map{|e| e.e }
    #end

    @events = @event_days.map{|ed| ed.events}.flatten

    #@event_days_name =EventDay.find(:name =>params[:event_day][:name])

  end

end
