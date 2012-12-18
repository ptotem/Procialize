class HomeController < ApplicationController

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
    @upcoming_events=@conference.event_days.select { |ed| ed.event_date==Date.today }.map { |ed| ed.events }.flatten.select { |e| Time.at(e.start.hour * 60 * 60 + e.start.min * 60 + e.start.sec)>(@now-3600) and Time.at(e.start.hour * 60 * 60 + e.start.min * 60 + e.start.sec)<(@now+1800) }
    @notice_board=@conference.organizers.map { |o| o.user }.map { |u| u.posts }.flatten.last(5).reverse
    @followed=(Follower.find_all_by_user_id_and_conference_id(@user.id, @conference.id).map { |f| User.find(f.follower_id) }).map { |u| u.posts }.flatten.last(10).reverse
    @graffiti=(User.all-(Follower.find_all_by_user_id_and_conference_id(@user.id, @conference.id).map { |f| User.find(f.follower_id) })).map { |u| u.posts }.flatten.select { |p| p.created_at>(Time.now-900) }.last(10).reverse
    @my_posts=current_user.posts.last(10).reverse

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

  def update_status
    @post=Post.create(:user_id => params[:user_id][0], :name => params[:comment][0])
    render :text => @post.name
  end


  def followers_status

    @user = current_user

  end

end