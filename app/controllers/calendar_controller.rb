class CalendarController < ApplicationController
  
  def index
    @user=current_user.id
    @ev=Event.find_by_user_id(@user).id
    @event_name = Event.find_by_user_id(@user).name
    #render :text => @user
    #return

    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    #@event_strips = Event.event_strips_for_month(@shown_month)


    @event_strips = current_user.events.event_strips_for_month(@shown_month)


  end
  
end
