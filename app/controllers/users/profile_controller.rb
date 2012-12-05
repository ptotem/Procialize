class Users::ProfileController < ApplicationController
  def index
    @user=User.find(params[:id])
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @educations=@user.educations.values[1].map { |t| "Class of #{t.endDate.year}, #{t.schoolName}" }
    @current_position=@user.positions.values[1].select { |p| p.isCurrent }.map { |p| "#{p.title}, #{p.company.name}" }[0]
    @past_positions=@user.positions.values[1].select { |p| !p.isCurrent }.map { |p| "#{p.title}, #{p.company.name}" }
    if Status.find_by_user_id(@user.id).blank?
      @user_status = "I am enjoying this event a lot"
    else
      @user_status = Status.find_all_by_user_id(@user.id).last
    end
  end
end
