class RatingsController < ApplicationController
  def index
    @user=current_user

    #@events=Rating.all.map{|i| i.}
    #@events=Event.all
    #@tracks=Track.all
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

  # @track=Track.find(params[:track_id][0])
  # unless  @track.nil?
  # @rate=Rating.find_all_by_track_id(@track)
  # @return_data=Array.new
  # @rate.each do |i|
  #   if i.user_id.include? current_user.id
  #     @like_return=1
  #   else
  #     @like_return=0
  #   end
  #   @return_data<<"#{@like_return}"
  #end
  # end
  # render :text => @return_data
  # return
 end

end
