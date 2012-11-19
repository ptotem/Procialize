class Users::ProfileController < ApplicationController
  def index
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @educations=@user.educations.values[1]
    #.map{|t| "Class of #{t.end_date.year}, #{t.school_name}"}
    #@current_position=@user.positions.values.select{|p| p.is_current}.map{|p| "#{p.title}, #{p.company.name}"}
    #@past_positions=@user.positions.values.select{|p| !p.is_current}.map{|p| "#{p.title}, #{p.company.name}"}
  end
end
