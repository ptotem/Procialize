class SearchController < ApplicationController
  def index
  end
  def search
    #@user=User.find(params[:id])
    @user=current_user
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
    @posts=@user.posts
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
      @last_seen=Location.find(UserLocation.find_all_by_user_id(@user.id).last.location_id)
    end
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
      @created=UserLocation.find_all_by_user_id(@user.id).last
    end
  end
end
