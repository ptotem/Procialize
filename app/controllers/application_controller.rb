class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :set_current_conference

  def set_current_conference
    @conference=current_user.participants.map { |p| p.conference }[0] unless current_user.blank?
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

end
