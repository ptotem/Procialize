class DesktopViewController < ApplicationController


  def index
    #-------------start of graffiti and user name-------------------#
    Time.zone = "New Delhi"
    @now=Time.at(Time.now.hour * 60 * 60 + Time.now.min * 60 + Time.now.sec).in_time_zone
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @batch=@user.batchie
    @upcoming_meetings = Meeter.find_all_by_user_id_and_status(current_user.id, true).map { |r| r.meeting }.select { |m| m.start_time>Time.now and m.start_time<Time.now+1800 }.last(2)
    @upcoming_events=@conference.event_days.select { |ed| ed.event_date==Date.today }.map { |ed| ed.events }.flatten.select { |e| Time.at(e.start.hour * 60 * 60 + e.start.min * 60 + e.start.sec)>(@now-3600) and Time.at(e.start.hour * 60 * 60 + e.start.min * 60 + e.start.sec)<(@now+1800) }
    @notice_board=@conference.organizers.map { |o| o.user }.map { |u| u.posts }.flatten.last(3).reverse
    @followed=(Follower.find_all_by_user_id_and_conference_id(@user.id, @conference.id).map { |f| User.find(f.follower_id) }).map { |u| u.posts }.flatten.last(10).reverse
    @graffiti=(User.all-(Follower.find_all_by_user_id_and_conference_id(@user.id, @conference.id).map { |f| User.find(f.follower_id) })-[current_user]-Organizer.all.map { |o| o.user }).map { |u| u.posts }.flatten.last(30).sort_by(&:created_at).reverse
    @my_posts=current_user.posts.last(3).reverse

    unless @user.id.blank?
      @post=Post.find_all_by_user_id(@user.id).last
    end
    @event_day_name=EventDay.find_by_event_date(Time.now)
    #-------------end of graffiti and user name-------------------#


    @concierge_services_name= ConciergeService.all.map { |i| i.name }
    @concierge_services_comments= ConciergeService.all.map { |i| i.comment }
    gon.services_comment=@concierge_services_comments


    #-------------start of speakers-------------------#
    @event_days = @conference.event_days
    @events= Event.find_all_by_event_day_id(@event_days)
    @speaker=Speaker.find_all_by_event_id(@events)
    @sp=@events.map { |sp| sp.speakers }.flatten
    #@se=@sp.map{ |e| e.event }.flatten
    @locations = @conference.locations
    @events = @event_days.map { |ed| ed.events }.flatten
    @event_locations=@events.map { |ev| ev.event_locations }.flatten
    @speak=Speaker.all


    render :layout => 'application1'
  end

  #-------------end of speakers-------------------------#















  #------------Start of questionables-------------------#
  def desktop_questionables
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @batch=@user.batchie
    @industry=@user.industry
    if params[:id].blank?
      @events=Questionable.all.map { |i| i.event_id }.uniq
    else
      @event=Event.find(params[:id]).id
      @events=Array.new
      @events<<@event
    end
    render :layout => "application1"
  end


  def desktop_voting
    @questionable=Questionable.find(params[:question_id][0])
    @questionable.like=@questionable.like+1
    @questionable.liking_by=@questionable.liking_by+','+"#{current_user.id}"
    @questionable.save
    render :text => @questionable.like
  end

  #
  #def desktop_question_view
  #  @user=current_user
  #  @name=@user.name
  #  @photo=@user.picture
  #  @headline=@user.headline
  #  @batch=@user.batchie
  #  #@event=Questionable.create(:event_id => params[:questionable][:event_id], :quest_name => params[:questionable][:quest_name], :user_id => @user.id, :approved => false)
  #  redirect_to :action => "ask_question"
  #end
  #
  #
  #def desktop_hide_quest
  #  @questionable=Questionable.find(params[:question_id][0])
  #  @questionable.hide=true
  #  @questionable.save
  #  render :text => @questionable.id
  #  return
  #end
  #
  #
  #def desktop_approve_quest
  #  @questionable=Questionable.find(params[:question_id][0])
  #  @questionable.approved=true
  #  @questionable.hide=nil
  #  @questionable.save
  #  render :text => @questionable.id
  #  return
  #end


  #------------End of questionables-------------------#


  #------------Start of start of assets_downloads-------------------#
  def desktop_assets_download
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @batch=@user.batchie
    @industry=@user.industry
    @assets_downloads=AssetsDownload.all
    render :layout => "application1"
  end

  #------------End of start of assets_downloads-------------------#


  #-----------------------------------------New_desktop_view-----------------------------------------------#


  #------------Start of Events-------------------#
  def desktop_events
    @event_days=@conference.event_days
    @event_days = EventDay.all
    @events = Event.all
    @tracks = Track.all
    render :layout => "application1"
  end


  def events_show
    @track = Track.find(params[:id])
    @attendees=Attendee.find_all_by_track_id(@track).map { |a| a.user }
    @my_attendee=Attendee.find_by_track_id_and_user_id(@track, current_user)
    @quest = Questionable.new

    @speaking=Array.new
    @track_speaker=TrackSpeaker.find_all_by_track_id(@track)
    @track_speaker.each do |t|
      @speaking<<t.speaker_id
    end
    @speaker_name=Speaker.find(@speaking)
    render :layout => 'application1'
  end

  def update_track
    @event_day = EventDay.find(params[:event_day_id])
    @ev = Event.find_all_by_event_day_id(@event_day)
    @returning_data =Array.new
    @ev.each do |i|
      @returning_data<<"#{i.id}|#{i.name}"
    end
    render :json => @returning_data
  end

  def update_event
    @eve = Event.find(params[:event_id])
    @tra = Track.order(:start).find_all_by_event_id(@eve.id)
    @return_data =Array.new
    @tra.each do |i|
      @return_data<<"#{i.id}|#{i.name}|#{i.start}"
    end
    render :json => @return_data
    # return
  end

  def desktop_accept
    @track=Track.find(params[:id])
    Attendee.create!(:track_id => @track.id, :user_id => current_user.id) unless Attendee.find_by_track_id_and_user_id(@track.id, current_user.id)
    respond_to do |format|
      format.html { redirect_to events_show_path, :notice => @track.name }
    end
  end


  def desktop_create_quest
    @user=current_user
    unless params[:questionable].blank?
      @track=Questionable.create(:track_id => params[:questionable][:track_id], :quest_name => params[:questionable][:quest_name], :user_id => @user.id, :approved => false)
    end
    redirect_to desktop_events_path


  end
#------------End of Events-------------------#




#------------Start of Meetings----------------#
  def meetings_index
    @meetings = Meeting.all
    @user = current_user
    @pending = Meeter.find_all_by_user_id_and_status(current_user.id, nil).map { |r| r.meeting }
    @scheduled = Meeter.find_all_by_user_id_and_status(current_user.id, true).map { |r| r.meeting }
    @declined = Meeter.find_all_by_user_id_and_status(current_user.id, false).map { |r| r.meeting }
    @sent = Meeting.find_all_by_user_id(@user.id).last(10).reverse
    @open=[]
    @sent.each do |meeting|
      if meeting.meeters.select{|meeter| meeter.status}.length>=1
        @scheduled << meeting
      else
        @open<<meeting
      end
    end
    @scheduled.flatten
    @open.flatten
    render :layout => "application1"
  end

  def meetings_edit
    @meeting = Meeting.find(params[:id])
  end

  def meetings_new
    @meeting = Meeting.new
    @users=[]
    @followed=Follower.find_all_by_user_id(current_user.id).map { |f| User.find(f.follower_id) }
    @users<<@followed
    @users<<(User.all - @followed)
    @user_list=@users.flatten.map {|u| [u.name, u.id]}
    render :layout => "application1"
  end

  def desktop_focussed_new
    @meeting = Meeting.new
    @meeter = params[:id]
    @users=[]
    @followed=Follower.find_all_by_user_id(current_user.id).map { |f| User.find(f.follower_id) }
    @users<<@followed
    @users<<(User.all - @followed)
    @user_list=@users.flatten.map { |u| [u.name, u.id] }
    respond_to do |format|
      format.html { render :html => @meeting, :layout => "application1" }
      format.json { render :json => @meeting, :layout => "application1" }
    end
  end


  def meetings_update
    @meeting = Meeting.find(params[:id])
    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to @meeting, :notice => 'Meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end


  def meetings_show
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @batch=@user.batchie
    @industry=@user.industry
    @meeting = Meeting.find(params[:id])
    @meeter = Meeter.find_by_user_id_and_meeting_id(current_user.id, @meeting.id)
    render :layout => "application1"
  end

  def meetings_accept
    @meeting=Meeting.find(params[:id])
    @meeter=@meeting.meeters.where('user_id=?', current_user.id).first
    @meeter.status=true
    @meeter.save
    redirect_to meetings_index_path
  end


  def meetings_create
    params[:meeting].parse_time_select! :start_time
    @meeting = Meeting.new(params[:meeting])
    respond_to do |format|
      if @meeting.save
        params[:meeter_users].each do |uid|
          Meeter.create!(:meeting_id => @meeting.id, :user_id => uid)
        end
        format.html { redirect_to meetings_index_path, :notice => 'Meeting was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render :action => "meetings_new" }
        format.json { render :json => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end
  #------------End of Meetings-------------------#


  #------------Start of Messages----------------#
  def messages_index
    @unread = Receipient.find_all_by_user_id_and_status(current_user.id, nil).map { |r| r.message }
    @read = Receipient.find_all_by_user_id_and_status(current_user.id, true).map { |r| r.message }
    @sent = Message.find_all_by_user_id(current_user.id).last(10).reverse
    render :layout => "application1"
  end


  def desktop_message_focussed_new
    @message = Message.new
    @receipient = params[:id]
    @all=false
    @last_message=nil
    unless params[:message].blank?
      @last_message=Message.find(params[:message])
      unless params[:all].blank?
        @receipients=@last_message.receipients.map { |r| r.user.id }
        @all=true
      end
    end
    @users=[]
    @followed=Follower.find_all_by_user_id(current_user.id).map { |f| User.find(f.follower_id) }
    @users<<@followed
    @users<<(User.all - @followed)
    #@user_list=@users.flatten.map { |u| [u.name.titlecase, u.id] }
    @user_list=@users.flatten.map { |u| [u.name.titlecase, u.id]-[current_user.name, current_user.id] }
    respond_to do |format|
      format.html { render :html => @message, :layout => "application1" }
      format.json { render :json => @message, :layout => "application1" }
    end
  end


  def messages_new
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @batch=@user.batchie
    @industry=@user.industry
    @message = Message.new
    @users=[]
    @followed=Follower.find_all_by_user_id(current_user.id).map { |f| User.find(f.follower_id) }
    @users<<@followed
    @users<<(User.all - @followed)
    @user_list=@users.flatten.map { |u| [u.name.titlecase, u.id]-[current_user.name, current_user.id] }
    render :layout => "application1"
  end


  def messages_create
    @message = Message.new(params[:message])
    respond_to do |format|
      if @message.save
        params[:receipient_users].each do |uid|
          Receipient.create!(:message_id => @message.id, :user_id => uid)
        end
        format.html { redirect_to messages_index_path, :notice => 'Message was successfully created.' }
      else
        format.html { render :action => "messages_new" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /meetings/1
  # PUT /meetings/1.json
  def messages_update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, :notice => 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end


  def messages_show
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @batch=@user.batchie
    @industry=@user.industry
    @message = Message.find(params[:id])
    if @receipient=Receipient.find_by_user_id_and_message_id(current_user.id, @message.id)
      @receipient.status=true
      @receipient.save
    end
    render :layout => 'application1'
  end


  def messages_accept
    @meeting=Meeting.find(params[:id])
    @meeter=@meeting.meeters.where('user_id=?', current_user.id).first
    @meeter.status=true
    @meeter.save
    redirect_to desktop_view_path
  end


  def messages_focussed_new
    @message = Message.new
    @receipient = params[:id]
    @all=false
    @last_message=nil
    unless params[:message].blank?
      @last_message=Message.find(params[:message])
      unless params[:all].blank?
        @receipients=@last_message.receipients.map { |r| r.user.id }
        @all=true
      end
    end
    @users=[]
    @followed=Follower.find_all_by_user_id(current_user.id).map { |f| User.find(f.follower_id) }
    @users<<@followed
    @users<<(User.all - @followed)
    @user_list=@users.flatten.map { |u| [u.name.titlecase, u.id]-[current_user.name ,current_user.id] }
    render :layout=> "application1"
  end


  def messages_edit
    @message = Message.find(params[:id])
  end

  #------------End of messages-------------------#


  #-------------start of delegates-------------------#
  def delegates_search
    #@user=User.find(params[:id])
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @industry=@user.industry
    @educations=[]
    @positions=[]


    @followers=Follower.find_all_by_follower_id(@user.id).select { |f| f.user unless f.user==current_user }.map { |f| f.user }
    @posts=@user.posts
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
      @last_seen=Location.find(UserLocation.find_all_by_user_id(@user.id).last.location_id)
    end
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
      @created=UserLocation.find_all_by_user_id(@user.id).last
    end

    render :layout => "application1"
  end


  def desktop_edit_profile
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @batch=@user.batchie
    @industry=@user.industry
    @batchlist=Array.new
    (2000..2013).each do |year|
      @batchlist << "Class of #{year}"
    end
    @batchlist << "Not from ISB"
    @batchlist << "ISB Student. Unknown Class"
    @batchlist.flatten
    render :layout => "application1"
  end


  def desktop_update_profile
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to desktop_graffiti_path
    end

  end


  def delegates_desktop
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @batch=@user.batchie
    @industry=@user.industry
    #@educations=[]
    #@positions=[]

    @followers=Follower.find_all_by_follower_id(@user.id).select { |f| f.user unless f.user==current_user }.map { |f| f.user }
    @posts=@user.posts
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
      @last_seen=Location.find(UserLocation.find_all_by_user_id(@user.id).last.location_id)
    end
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
      @created=UserLocation.find_all_by_user_id(@user.id).last
    end
  end


  def delegate_profile_index
    @user=User.find(params[:id])
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @industry=@user.industry
    @interest=@user.interest
    @educations=@user.educations
    @location=@user.location
    @skills=@user.skills
    @company=@user.company
    #@educations=[]
    #@positions=[]

    @followers=Follower.find_all_by_follower_id(@user.id).select { |f| f.user }.map { |f| f.user }
    @posts=@user.posts.last(10).reverse
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
      @last_seen=Location.find(UserLocation.find_all_by_user_id(@user.id).last.location_id)
    end

    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
      @created_at=UserLocation.find_all_by_user_id_and_location_id(@user.id, @last_seen.id).last
    end
    @post=Post.find_all_by_user_id(@user.id).last


    if @user!=current_user
      if !@user.viewers_name.blank?
        @viewers_name=@user.viewers_name
        @person_name=@viewers_name.split('|').last
        @person=@person_name.split(':').first.to_i + 1
        @viewing=@person.to_s+':'+current_user.name
        @user.viewers_name=@viewers_name +'|'+@viewing
      else
        @user.viewers_name="1:#{current_user.name}"
      end
      @user.save
    end
    render :layout => "application1"
  end


  def desktop_following
    if Follower.find_by_user_id_and_follower_id(current_user.id, params[:id]).blank?
      Follower.create!(:user_id => current_user.id, :conference_id => Conference.last.id, :follower_id => params[:id])
      render :text => "Unfollow"
    else
      Follower.find_by_user_id_and_follower_id(current_user.id, params[:id]).destroy
      render :text => "Follow"
    end

  end
  #-------------end of delegates-------------------#




  #-------------Start of Graffiti-------------------#
  def desktop_graffiti
    #@now=Time.at(Time.now.hour * 60 * 60 + Time.now.min * 60 + Time.now.sec)
    Time.zone = "New Delhi"
    @now=Time.at(Time.now.hour * 60 * 60 + Time.now.min * 60 + Time.now.sec).in_time_zone

    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @industry=@user.industry
    @interest=@user.interest
    @educations=@user.educations
    @location=@user.location
    @skills=@user.skills


    @batch=@user.batchie

    @upcoming_meetings = Meeter.find_all_by_user_id_and_status(current_user.id, true).map { |r| r.meeting }.select { |m| m.start_time>Time.now and m.start_time<Time.now+1800 }.last(2)
    @upcoming_events=@conference.event_days.select { |ed| ed.event_date==Date.today }.map { |ed| ed.events }.flatten.select { |e| Time.at(e.start.hour * 60 * 60 + e.start.min * 60 + e.start.sec)>(@now-3600) and Time.at(e.start.hour * 60 * 60 + e.start.min * 60 + e.start.sec)<(@now+1800) }
    @notice_board=@conference.organizers.map { |o| o.user }.map { |u| u.posts }.flatten.last(3).reverse
    @followed=(Follower.find_all_by_user_id_and_conference_id(@user.id, @conference.id).map { |f| User.find(f.follower_id) }).map { |u| u.posts }.flatten.last(10).reverse
    @graffiti=(User.all-(Follower.find_all_by_user_id_and_conference_id(@user.id, @conference.id).map { |f| User.find(f.follower_id) })-[current_user]-Organizer.all.map{|o| o.user}).map { |u| u.posts}.flatten.last(30).sort_by(&:created_at).reverse
    @my_posts=current_user.posts.last(3).reverse

    if !UserLocation.find_all_by_user_id(@user.id).blank?
      @last_seen=Location.find(UserLocation.find_all_by_user_id(@user.id).last.location_id)

    end
    unless @last_seen.blank?
      @created_at=UserLocation.find_all_by_user_id_and_location_id(@user.id, @last_seen.id).last
    end
    unless @user.id.blank?
      @post=Post.find_all_by_user_id(@user.id).last
    end
    @event_day_name=EventDay.find_by_event_date(Time.now)

    render :layout => "application1"
  end
  #-------------End of Graffiti-------------------#




  #-------------start of concierge-------------------#
  def concierge_service_desktop
    @user=current_user
    @concierge_services_name= ConciergeService.all.map { |i| i.name }
    @concierge_services_comments= ConciergeService.all.map { |i| i.comment }
    gon.services_comment=@concierge_services_comments
    render :layout => "application1"
  end


  def order_services_desktop
    @message = Message.new
    @message.body=params[:message]
    @message.user_id=current_user.id
    @message.conference_id=@conference.id
    @message.save
    @user=User.find_by_email("admin@organizer.com")
    @receipient=Receipient.create!(:user_id => @user.id, :message_id => @message.id)
    @receipient.status=nil
    @receipient.save

    respond_to do |format|
      if @message.save
        format.html { redirect_to concierge_service_desktop_path, :notice => 'Message was successfully created.' }
        format.json { render :json => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "concierge_service_desktop" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  #-------------end of concierge-------------------#


  #-------------start of contact_us-------------------#
  def contact_us_new
    @message = Message.new
    @users=[]
    @followed=Follower.find_all_by_user_id(current_user.id).map { |f| User.find(f.follower_id) }
    @users<<@followed
    @users<<(User.all - @followed)
    @user_list=@users.flatten.map { |u| [u.name.titlecase, u.id] }
    @use=@users.flatten.select{|u| (u.email=="support@corcon.org")}.map{|u| u.name }

    render :layout => "application1"
  end


  def contact_us_create
    @message = Message.new(params[:message])
    @message.save
    @receipient=Receipient.create!(:user_id => 995, :message_id => @message.id)
    @receipient.status=nil
    @receipient.save

    respond_to do |format|
      if @message.save
        format.html { redirect_to contact_us_new_path, :notice => 'Message was successfully created.' }
        format.json { render :json => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "contact_us_new" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  #-------------end of contact_us-------------------#



  #-------------start of ratings-------------------#
  def feed_me
    @user=current_user
    @events=Event.all
    @rating=Rating.create(:user_id => params[:user_id][0], :track_id => params[:track_id][0], :rate => params[:rate][0])
    render :text => @rating.save, :layout => "application1"
    return
  end


  def desktop_ratings
    @user=current_user
    @event_days=@conference.event_days
    @event_days = EventDay.all
    @events = Event.all
    @tracks = Track.all
    render :layout => "application1"
  end

  def desktop_rating_appending
    render :text => params[:track_id][0]
  end


  #-------------end of ratings-------------------------#


  #-------------start of questionable-------------------#
  def desktop_ask_question
    @user=current_user
    #gon.current_user_id=@user.id
    @event_days=@conference.event_days
    @event_days = EventDay.all
    @events = Event.all
    @tracks = Track.all
    #redirect_to event_path(@event)
    if (!@track.nil?)
      @track = Track.find(params[:track_id])
    end
    if (!@questionable.nil?)
      @questionable = @track.questionables.create(params[:questionable])
    end
    render :layout => "application1"
  end

  def desktop_questions_appending
    @quest=Questionable.find_all_by_track_id_and_approved(params[:track_id], true).sort_by(&:like).reverse
    @return_data=Array.new
    @quest.each do |i|
      if i.liking_by.include? current_user.id.to_s
         @like_return=1
      else
        @like_return=0
      end
      @return_data<<"#{i.id}|#{i.quest_name}|#{i.user_id}|#{User.find(i.user_id).name}|#{i.like}|#{i.liking_by}|#{@like_return}"
    end
    render :json => @return_data

  end

  def desktop_create_question
    @user=current_user
    unless params[:questionable].blank?
      @track=Questionable.create(:track_id => params[:question_appending], :quest_name => params[:questionable][:quest_name], :user_id => @user.id, :approved => false)
    end
    redirect_to desktop_ask_question_path
  end

  #-------------end of questionable-------------------#


  #-------------Start of Speakers-------------------#
  def desktop_speaker
    @speak=Speaker.all
    @speak_id=Array.new
    @tracker=Array.new
    @speak.each do |s|
      @speak_id<<s.id
    end
    @speaker_track=TrackSpeaker.find_all_by_speaker_id(@speak_id)
    @speaker_track.each do |s|
      @tracker<<s.track_id
    end

    @track_name=Track.find(@tracker)

    render :layout => "application1"
  end
  #-------------End of Speakers-------------------#




  #--------------Start of Exhibitor----------------#

  def exhibitor_desk
    @exhibitor=Exhibitor.all
    render :layout => "application1"
  end


  def exhibitor_desk_show
    @exhibitor=Exhibitor.find(params[:id])
    @exhi_name=@exhibitor.name
    @exhi_industry=@exhibitor.industry
    @exhi_description=@exhibitor.description
    @exhi_stall=@exhibitor.stall_no
    @exhi_contact_no=@exhibitor.contact_no

    @user_id=Array.new
    @exhi_user=ExhibitorUser.find_all_by_exhibitor_id(@exhibitor.id)
    @exhi_user.each do |u|
      @user_id<<u.user_id
    end

    @user_name=User.find(@user_id)

    render :layout => "application1"
  end

  #--------------End of Exhibitor----------------#



end
