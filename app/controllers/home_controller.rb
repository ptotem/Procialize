class HomeController < ApplicationController

  def index

    @now=Time.at(Time.now.hour * 60 * 60 + Time.now.min * 60 + Time.now.sec)

    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @batch=@user.batchie

    @upcoming_meetings = Meeter.find_all_by_user_id_and_status(current_user.id, true).map { |r| r.meeting }.select{|m| m.start_time>Time.now and m.start_time<Time.now+7200 }
    @upcoming_events=@conference.event_days.select{|ed| ed.event_date>Date.yesterday}.map{|ed| ed.events}.flatten.select{|e| Time.at(e.start.hour * 60 * 60 + e.start.min * 60 + e.start.sec)>@now-3600 and Time.at(e.start.hour * 60 * 60 + e.start.min * 60 + e.start.sec)<(@now+7200) }
    @unread = Receipient.find_all_by_user_id_and_status(current_user.id, nil).map { |r| r.message }
    @pending = Meeter.find_all_by_user_id_and_status(current_user.id, nil).map { |r| r.meeting }
    @notice_board=@conference.organizers.map{|o| o.user}.map{|u| u.posts}.flatten
    @followed=(Follower.find_all_by_user_id_and_conference_id(@user.id,@conference.id).map{|f| User.find(f.follower_id)}<<current_user).map{|u| u.posts}.flatten
    @graffiti=(User.all-(Follower.find_all_by_user_id_and_conference_id(@user.id,@conference.id).map{|f| User.find(f.follower_id)}<<current_user)).map{|u| u.posts}.flatten.select{|p| p.created_at>(Time.now-900)}

  end

  def update_status
    @post=Post.create(:user_id => params[:user_id][0], :name => params[:comment][0])
    render :text => @post.name
  end


  def followers_status

    @user = current_user

  end

end