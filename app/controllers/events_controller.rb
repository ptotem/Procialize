class EventsController < ApplicationController
  def edit
  end

  def show
    #@event = Event.find(params[:id])
    @track = Track.find(params[:id])
    @attendees=Attendee.find_all_by_track_id(@track).map { |a| a.user }
    @my_attendee=Attendee.find_by_track_id_and_user_id(@track, current_user)
    @quest = Questionable.new
  end

  def show_page
    @event = Event.find(params[:id])
  end

  def index
    #render :text => @conference.participants.map { |participant| participant.user }
    #return
    #@conference= current_user.participants.map { |p| p.conference }[1]
    #return

    @event_days=@conference.event_days
    @event_days = EventDay.all
    @events = Event.all
    @tracks = Track.all


    #@event_days = @conference.event_days
    #@ev1=@event_days.find_by_name_and_sequence("Day One",1).id
    #@event1=Event.group(:start).find_all_by_event_day_id(@ev1)
    #@ev2=@event_days.find_by_name_and_sequence("Day Two",2).id
    #@event2=Event.group(:start).find_all_by_event_day_id(@ev2)
    #
    #@locations = @conference.locations
    #@events = @event_days.map { |ed| ed.events }.flatten
    #@event_locations=@events.map { |ev| ev.event_locations }.flatten


  end


  def update_artists
    #@event_day = EventDay.find(params[:event_day][:event_day_id]).reject(&:blank?) unless params[:event_day].nil?
    #@ev = Event.find_all_by_event_day_id(@event_day).map{|a| [a.name, a.id]}
    @event_day = EventDay.find(params[:event_day_id])
    @ev = Event.find_all_by_event_day_id(@event_day)
    @returning_data =Array.new
    @ev.each do |i|
      @returning_data<<"#{i.id}|#{i.name}"
    end
     render :json => @returning_data
    #return
    #
    #@tr= Track.find_all_by_event_id(@ev).map{|s| [s.name, s.id]}
    #render :text => @ev
    #return

  end

  def update_songs
    @eve = Event.find(params[:event_id])
    @tra = Track.find_all_by_event_id(@eve.id)
    @return_data =Array.new
    @track_start=Array.new
    @tra.each do |i|
      @questionable = Questionable.order("questionables.like DESC").order("questionables.created_at DESC").find_all_by_track_id_and_approved(i.id, true)
      @return_data<<"#{i.id}|#{i.name}|#{i.start}"
    end
    render :json => @return_data

  end


  def create_quest
    @user=current_user
    unless params[:questionable].blank?
      @track=Questionable.create(:track_id => params[:questionable][:track_id], :quest_name => params[:questionable][:quest_name], :user_id => @user.id, :approved => false)
    end
    redirect_to events_path
    flash[:notice]="Your Question has been sent for the moderator's approval"
  end





  def accept
    @track=Track.find(params[:id])
    Attendee.create!(:track_id => @track.id, :user_id => current_user.id) unless Attendee.find_by_track_id_and_user_id(@track.id,current_user.id)
    respond_to do |format|
    format.html{redirect_to event_path,:notice =>"Your participation has been confirmed"}
      end
  end

end
