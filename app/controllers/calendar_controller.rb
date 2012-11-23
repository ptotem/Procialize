class CalendarController < ApplicationController
  
  def index
    @user=current_user.id
    @ev=Event.find_by_user_id(@user).id
    #@event_name = Event.find_by_user_id(@user).event_name
    #@tasks = Task.this_month
    #@ev_d=params[:event_day]
    #@eve=Event.find_all_by_user_id_and_event_day(@user.id,params[:event_day])
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = current_user.events.event_strips_for_month(@shown_month)

  end
  
end
