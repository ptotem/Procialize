class HomeController < ApplicationController

  def index

    require 'linkedin'
    client = LinkedIn::Client.new('dr6pt80d3n8a', 'EO46hBzTps3IsEvF')
    client.authorize_from_access(current_user.token, current_user.secret)
    @profile=client.profile
    @user=current_user


  end

end
