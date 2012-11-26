class HomeController < ApplicationController

  def index

    #require 'linkedin'
    #client = LinkedIn::Client.new('dr6pt80d3n8a', 'EO46hBzTps3IsEvF')
    #client.authorize_from_access(current_user.token, current_user.secret)
    #@profile=client.profile
    #@linkedin_user=client.profile(:fields=>%w(educations positions))
    #@position=@linkedin_user.positions.all.select{|p| p.is_current}.map{|p| "#{p.title}, #{p.company.name}"}
    #@education=@linkedin_user.educations.all.select{|e| e.degree.include?("PG")}.map{|t| "Class of #{t.end_date.year}, #{t.school_name}"}
    #@user=current_user

    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @events = Event.all
    @status=Status.all
    @ev=Event.find_by_user_id(@user).id

    @events = Event.all
    #@ev_d=@events.find_by_@evt
    #@event = Event.find_by_user_id(@user).id

    @evt = Array.new
    @user.events.each do |eve|
      @evt<<eve.id
    end
    @evt=@evt.uniq
    #render :text=>@ev_d
    #return


    #@ev_d=params[:event_day]
    #@eve=Event.find_all_by_user_id_and_event_day(@user.id,params[:event_day])
    @days=Array.new
    @user.events.each do |event|
      @days<<event.event_day
    end
    @days=@days.uniq
    @ev_n=Event.find_all_by_user_id_and_event_day(@user.id,@days)



  end
    #@status = Status.create(:comment => params[:status][:comment],:user_id => @user.id)
    #@status=Status
  end

  def create

  end

   def show
     @user=current_user
     @ev=Event.find_by_user_id(@user).id
     @event = Event.find(params[:id])
     @events = Event.all
     @ev_d=params[:event_day]
     @eve=Event.find_all_by_user_id_and_event_day(@user.id,params[:event_day])
     @days=Array.new
     @user.events.each do |event|
       @days<<event.event_day
     end
     @days=@days.uniq
     @evt = Array.new
     @user.events.each do |eve|
       @evt<<eve.id
     end
     @evt=@evt.uniq
     #render :text=>@evt
     #return

     @ev_d=params[:event_day]
     #@ev_d=params[:event_day]
     #@eve=Event.find_all_by_user_id_and_event_day(@user.id,params[:event_day])
     @days=Array.new
     @user.events.each do |event|
       @days<<event.event_day
     end
     @days=@days.uniq
     @ev_n=Event.find_all_by_user_id_and_event_day(@user.id,@days)

end
