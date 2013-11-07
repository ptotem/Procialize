class RatingsController < ApplicationController
  def index
    @user=current_user
    @event_days=@conference.event_days
    @event_days = EventDay.all
    @events = Event.all
    @tracks = Track.all

  end


  def user_event
    @rating=Rating.create(:user_id => params[:user_id][0], :track_id => params[:track_id][0],:rate => params[:rate][0])
    render :text => @rating.save
    return
  end


 def rating_appending
   render :text => params[:track_id][0]
 end

end
