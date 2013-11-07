class SearchController < ApplicationController
  skip_before_filter :authenticate_user! ,:set_current_conference,:only => :search_delegates

  def index
  end



  def search
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @industry=@user.industry
    @educations=[]
    @positions=[]

    #----Start For linkedin user educations and positions-----#
      #unless @user.educations.blank?
      #  @educations=@user.educations.values[1].map { |t| t.endDate.blank? ? "" :"Class of #{t.endDate.year}, #{t.schoolName}" }.uniq
      #end
      #unless @user.positions.blank?
      #  unless @user.positions.values[1].blank?
      #    @positions=@user.positions.values[1].map { |p| "#{p.title}, #{p.company.name}" }.uniq
      #  end
      #end
    #----End For linkedin user educations and positions-----#

    @followers=Follower.find_all_by_follower_id(@user.id).select { |f| f.user unless f.user==current_user }.map { |f| f.user }
    @posts=@user.posts
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
      @last_seen=Location.find(UserLocation.find_all_by_user_id(@user.id).last.location_id)
    end
    if !UserLocation.find_all_by_user_id(@user.id).last.blank?
      @created=UserLocation.find_all_by_user_id(@user.id).last
    end


  end



  def search_delegates
   @users=User.all - User.find_all_by_email("organizer@procialize.com")
    render :layout => "search_delegates"
  end
end
