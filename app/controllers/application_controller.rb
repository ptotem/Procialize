class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  before_filter :set_current_conference
  before_filter :logos

  #after_filter :notify


  #rescue_from CanCan::AccessDenied do |exception|
  #  #redirect_to root_url, :alert => exception.message
  #  render file: "#{Rails.root}/public/422", formats: [:html], status: 422, layout: false
  #end


  #check_authorization


  def set_current_conference
    User.current = current_user
    @conference=Conference.last
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    "/wait"
  end


  def update_location
    @user_location=UserLocation.create!(:user_id => params[:user][0], :location_id => params[:location][0])
    render :text => Location.find(@user_location.location_id).name
  end


  def logos
    @logos=Logos.all
  end




end
