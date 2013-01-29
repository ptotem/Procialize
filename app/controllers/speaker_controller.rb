class SpeakerController < ApplicationController
  def index

    @event_days = @conference.event_days
    @events= Event.find_all_by_event_day_id(@event_days)
    @speaker=Speaker.find_all_by_event_id(@events)
    @sp=@events.map { |sp| sp.speakers}.flatten
    #@se=@sp.map{ |e| e.event }.flatten
    @locations = @conference.locations
    @events = @event_days.map { |ed| ed.events }.flatten
    @event_locations=@events.map { |ev| ev.event_locations }.flatten
    @speak=Speaker.all


  end
end


