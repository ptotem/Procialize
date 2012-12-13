class EventsController < ApplicationController
  def edit
  end

  def show
    @event = Event.find(params[:id])
    @attendees=Attendee.find_all_by_event_id(@event).map { |a| a.user }
    @my_attendee=Attendee.find_by_event_id_and_user_id(@event, current_user)
  end

  def show_page
    @event = Event.find(params[:id])
  end

  def index
    @event_days = @conference.event_days
    @ev1=@event_days.find_by_name_and_sequence("Day One",1).id
    @event1=Event.find_all_by_event_day_id(@ev1)
    @ev2=@event_days.find_by_name_and_sequence("Day Two",2).id
    @event2=Event.find_all_by_event_day_id(@ev2)
    @ev3=@event_days.find_by_name_and_sequence("Day Three",3).id
    @event3=Event.find_all_by_event_day_id(@ev3)


    @locations = @conference.locations
    @events = @event_days.map { |ed| ed.events }.flatten
    @event_locations=@events.map { |ev| ev.event_locations }.flatten
  end

  def accept
    @event=Event.find(params[:id])
    Attendee.create!(:event_id => @event.id, :user_id => current_user.id) unless Attendee.find_by_event_id_and_user_id(@event.id,current_user.id)
    respond_to do |format|
    format.html{redirect_to events_path,notice: "Accepted"}
      end
  end

end
