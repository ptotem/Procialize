class Users::ProfileController < ApplicationController
  def index
    @user=User.find(params[:id])
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @educations=@user.educations.values[1].map { |t| t.endDate.blank? ? "":"Class of #{t.endDate.year}, #{t.schoolName}" }.uniq
    @positions=@user.positions.values[1].map { |p| "#{p.title}, #{p.company.name}" }.uniq
  end
end
