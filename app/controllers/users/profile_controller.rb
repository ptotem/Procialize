class Users::ProfileController < ApplicationController
  require 'linkedin'


  def index
    @user=User.find(params[:id])
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @industry=@user.industry
    @interest=@user.interest
    @educations=@user.educations
    @location=@user.location
    @skills=@user.skills
    @positions=[]
    #unless @user.educations.blank? or @user.educations.values[1].blank?
    #  @educations=@user.educations.values[1].map { |t| t.endDate.blank? ? "" :"Class of #{t.endDate.year}, #{t.schoolName}" }.uniq
    #end
    #unless @user.positions.blank? or @user.positions.values[1].blank?
    #  @positions=@user.positions.values[1].map { |p| "#{p.title}, #{p.company.name unless p.blank?}" }.uniq
    #end

    #@followers=Follower.find_all_by_follower_id(@user.id).select { |f| f.user unless f.user==current_user }.map { |f| f.user }
    @followers=Follower.find_all_by_follower_id(@user.id).select { |f| f.user }.map { |f| f.user }
    @posts=@user.posts.last(10).reverse
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
      @last_seen=Location.find(UserLocation.find_all_by_user_id(@user.id).last.location_id)
    end
    #if !UserLocation.find_all_by_user_id(@user.id).last.blank?
    #@created=UserLocation.find_all_by_user_id(@user.id).last
    #end
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
    render :layout => "profile"
  end

  def following
    if Follower.find_by_user_id_and_follower_id(current_user.id, params[:id]).blank?
      Follower.create!(:user_id => current_user.id, :conference_id => Conference.last.id, :follower_id => params[:id])
      render :text => "Unfollow"
    else
      Follower.find_by_user_id_and_follower_id(current_user.id, params[:id]).destroy
      render :text => "Follow"
    end

  end


  def edit
    @user=current_user
    @batchlist=Array.new
    (2000..2013).each do |year|
      @batchlist << "Class of #{year}"
    end
    @batchlist << "Not from ISB"
    @batchlist << "ISB Student. Unknown Class"
    @batchlist.flatten
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to :action => :index
      flash[:notice] = 'Successfully Updated Profile'

    else
      render 'edit'
    end
  end


  #def callback
  #  client = LinkedIn::Client.new("ljzad7w5p948", "sUZB5WRK34cmt0FN")
  #  if session[:atoken].nil?
  #    pin = params[:oauth_verifier]
  #    atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
  #    session[:atoken] = atoken
  #    session[:asecret] = asecret
  #  else
  #    client.authorize_from_access(session[:atoken], session[:asecret])
  #  end
  #  @profile = client.profile
  #  @connections = client.connections
  #end
  #
  #
  #def  index_for_linkedin
  #  client = LinkedIn::Client.new("ljzad7w5p948", "sUZB5WRK34cmt0FN")
  #  request_token = client.request_token(:oauth_callback =>
  #                                           "http://localhost:3000/auth/callback")
  #                                           #"http://#{request.host_with_port}/auth/callback")
  #  session[:rtoken] = request_token.token
  #  session[:rsecret] = request_token.secret
  #  redirect_to client.request_token.authorize_url
  #
  #end


end
