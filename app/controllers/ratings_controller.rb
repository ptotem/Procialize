class RatingsController < ApplicationController
  def index
    @user=current_user

    #@events=Rating.all.map{|i| i.}
    @events=Event.all
  end


  def user_event
    #@rating=Rating.create(:user_id => params[:rating][:user_id], :eveent_id => params[:rating][:event_id])

    @rating=Rating.create(:user_id => params[:user_id][0], :event_id => params[:event_id][0],:rate => params[:rate][0])
    #@rating.save
    render :text => @rating.save
    return
    #render :text => @post.name
    #render :text => params
    #return

  end


  #def rating_up
  #
  #  @rating=Rating.create(:rate => params[:rate][0])
  #  #@rating.save
  #  render :text => @rating.save
  #  return
  #  #render :text => params
  #  #return
  #
  #end

end
