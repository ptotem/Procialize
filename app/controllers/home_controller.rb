class HomeController < ApplicationController

  def index

    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @statuses = Status.all
    @last_status = Status.find_all_by_user_id(@user).last
    @status = Status.new
  end

  def update_status
    @status=Status.create(:user_id=>params[:user_id][0], :comment=>params[:comment][0])
    render :text=>@status.comment
  end



  def followers_status

    @user = current_user

  end

end