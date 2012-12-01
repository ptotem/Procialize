class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :set_current_conference

  def set_current_conference
    @conference=current_user.participants.map { |p| p.conference }[0]
  end


end
