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
    @company=@user.company
    @positions=[]
    @followers=Follower.find_all_by_follower_id(@user.id).select { |f| f.user }.map { |f| f.user }
    @posts=@user.posts.last(10).reverse
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
      @last_seen=Location.find(UserLocation.find_all_by_user_id(@user.id).last.location_id)
    end
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
      @created_at=UserLocation.find_all_by_user_id_and_location_id(@user.id, @last_seen.id).last
    end
    @post=Post.find_all_by_user_id(@user.id).last


    if current_user
      @curr_user=current_user
      if !@curr_user.person_view.blank?
        @viewers_name=@curr_user.person_view
        @person_name=@viewers_name.split('|').last
        @person=@person_name.split(':').first.to_i + 1
        @viewing=@person.to_s+':'+@user.name
        current_user.person_view=@viewers_name +'|'+@viewing
      else
        @curr_user.person_view="1:#{User.find(params[:id]).name}"
      end
      @curr_user.save
    end



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

  # User followers
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


 # Profile Update or Edit
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to :action => :index
      flash[:notice] = 'Successfully Updated Profile'

    else
      render 'edit'
    end
  end


end
