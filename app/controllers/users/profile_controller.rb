class Users::ProfileController < ApplicationController
  def index
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @educations=@user.educations.values[1].map{|t| "Class of #{t.endDate.year}, #{t.schoolName}"}
    @current_position=@user.positions.values[1].select{|p| p.isCurrent}.map{|p| "#{p.title}, #{p.company.name}"}[0]
    @past_positions=@user.positions.values[1].select{|p| !p.isCurrent}.map{|p| "#{p.title}, #{p.company.name}"}
  end
end
