class HomeController < ApplicationController

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  def index


    #@now=Time.at(Time.now.hour * 60 * 60 + Time.now.min * 60 + Time.now.sec)
    Time.zone = "New Delhi"
    @now=Time.at(Time.now.hour * 60 * 60 + Time.now.min * 60 + Time.now.sec).in_time_zone

    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @batch=@user.batchie

    @upcoming_meetings = Meeter.find_all_by_user_id_and_status(current_user.id, true).map { |r| r.meeting }.select { |m| m.start_time>Time.now and m.start_time<Time.now+1800 }.last(2)
    #@upcoming_events=@conference.event_days.select { |ed| ed.event_date==Date.today }.map { |ed| ed.events }.flatten.select { |e| Time.at(e.start.hour * 60 * 60 + e.start.min * 60 + e.start.sec)>(@now-3600) and Time.at(e.start.hour * 60 * 60 + e.start.min * 60 + e.start.sec)<(@now+1800) }
    #@notice_board=@conference.organizers.map { |o| o.user }.map { |u| u.posts }.flatten.last(3).reverse
    #@followed=(Follower.find_all_by_user_id_and_conference_id(@user.id, @conference.id).map { |f| User.find(f.follower_id) }).map { |u| u.posts }.flatten.last(10).reverse
    #@graffiti=(User.all-(Follower.find_all_by_user_id_and_conference_id(@user.id, @conference.id).map { |f| User.find(f.follower_id) })-[current_user]-Organizer.all.map{|o| o.user}).map { |u| u.posts}.flatten.last(30).sort_by(&:created_at).reverse
    #@my_posts=current_user.posts.last(3).reverse

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
    @user_themes=@user.themes

    if params[:first_time]
      flash[:message]="welcome #{current_user.name}"
    end

  end

  def update_status
    @post=Post.create(:user_id => params[:user_id][0], :name => params[:comment][0])
    render :text => @post.name
  end


  def followers_status

    @user = current_user

  end


  def graffiti
    #@now=Time.at(Time.now.hour * 60 * 60 + Time.now.min * 60 + Time.now.sec)
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
  end


  def theme_changer
    @user=User.find(params[:user_id][0])
    @user.themes=params[:themes][0]
    @user.save
    render :text => @user.themes
  end

  def concierge_service
    @user=current_user
    @user_themes=@user.themes
    @concierge_services_name=  ConciergeService.all.map{|i| i.name}
    @concierge_services_comments=  ConciergeService.all.map{|i| i.comment}
    gon.services_comment=@concierge_services_comments
  end


  def order_services
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
        format.html { redirect_to root_path, :notice=> 'Request Sent to Admin' }
        format.json { render :json => @message, :status => :created, :location => @message }
      else
        format.html { render :action =>"new" }
        format.json { render :json =>@message.errors, :status=> :unprocessable_entity }
      end
    end
  end





  def gettweets
    @tweets=Twitter.search("#rajnikanth", :lang => "en", :count => 10,:result_type => "recent").results.map do |status|
      "#{status.from_user}: #{status.text}"
    end
    render :text=>@tweets
    return
  end


  def settweetcounter
    @logo=Logos.first
    @logo.tweet_count=params[:count].to_i
    @logo.save
    render :text=>@logo.tweet_count
  end


  def assets_download
    @user=current_user
    @user_themes=@user.themes
    @assets_downloads=AssetsDownload.all
  end


  def trigger_recommend
    @users=User.all
    @user=current_user.id
    render :layout => "application1"
  end



  def send_mail_to_recommended_users
    @users=params[:user_id]
    @users.each do  |l|
      @user=User.find(l)
      if @user.interest != ""
        @user_in=User.find_all_by_industry(@user.interest).shuffle[0..2].map{|i| i.name}
      elsif @user.interest == "" and @user.industry != ""
        @user_in=User.find_all_by_industry(@user.industry).shuffle[0..2].map{|i| i.name}
      else
        @user_in=User.all.shuffle[0..2].map{|i| i.name}
      end
    end
    @user_in.delete(@user.name)
    @user.recommend=@user_in.to_s.gsub(/"/,"").gsub("[","").gsub("]","")
    @user.recommend_select=true
    @user.save
    render :text =>@user.recommend_select
    return
  end


  def survey_storing
    @survey_storing=SurveyAnswer.create(:user_id => params[:user_id][0], :survey_question_id => params[:survey_question_id][0],:ans => params[:ans][0])
    render :text => @survey_storing.save
    return
  end


  def editing_profile
    @industry_edit=User.find(params[:user_id][0])
    @industry_edit.industry= params[:industry][0]
    @industry_edit.save
    render :text =>  @industry_edit.save
    return
  end


end
