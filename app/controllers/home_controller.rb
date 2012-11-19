class HomeController < ApplicationController

  def index

    #require 'linkedin'
    #client = LinkedIn::Client.new('dr6pt80d3n8a', 'EO46hBzTps3IsEvF')
    #client.authorize_from_access(current_user.token, current_user.secret)
    #@profile=client.profile
    #@linkedin_user=client.profile(:fields=>%w(educations positions))
    #@position=@linkedin_user.positions.all.select{|p| p.is_current}.map{|p| "#{p.title}, #{p.company.name}"}
    #@education=@linkedin_user.educations.all.select{|e| e.degree.include?("PG")}.map{|t| "Class of #{t.end_date.year}, #{t.school_name}"}
    #@user=current_user
    #

  end

end
