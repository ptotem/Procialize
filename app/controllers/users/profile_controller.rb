class Users::ProfileController < ApplicationController
  def index
    @user=User.find(params[:id])
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @industry=@user.industry
    @educations=[]
    @positions=[]
    unless @user.educations.blank?
      @educations=@user.educations.values[1].map { |t| t.endDate.blank? ? "" :"Class of #{t.endDate.year}, #{t.schoolName}" }.uniq
    end
    unless @user.educations.blank?
      @positions=@user.positions.values[1].map { |p| "#{p.title}, #{p.company.name}" }.uniq
    end
    @followers=Follower.find_all_by_follower_id(@user.id).select { |f| f.user unless f.user==current_user }.map { |f| f.user }
    @posts=@user.posts.last(10).reverse
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
    @last_seen=Location.find(UserLocation.find_all_by_user_id(@user.id).last.location_id)
    end
    #if !UserLocation.find_all_by_user_id(@user.id).last.blank?
    #@created=UserLocation.find_all_by_user_id(@user.id).last
    #end
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
    @created_at=UserLocation.find_all_by_user_id_and_location_id(@user.id,@last_seen.id).last
    end
    @post=Post.find_all_by_user_id(@user.id).last
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
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to action: :index
    else
      render 'edit'
    end
  end





end
