class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  before_filter :set_current_conference
  before_filter :logos

  #after_filter :notify

  def set_current_conference
    User.current = current_user
    @conference=Conference.last
  end

  def after_sign_out_path_for(resource_or_scope)
     new_user_session_path
  end

  #def after_sign_in_path_for(resource_or_scope)
  #  "/wait"
  #end


  def update_location
    @user_location=UserLocation.create!(:user_id => params[:user][0], :location_id => params[:location][0])
    render :text => Location.find(@user_location.location_id).name
  end


  def logos
    @logos=Logos.all
  end




end
