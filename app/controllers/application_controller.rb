class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :set_current_conference

  def set_current_conference
    if !current_user.blank?
      if !current_user.participants.blank?
        @conference=current_user.participants.map { |p| p.conference }[0]
      else
        Participant.create!(:conference_id => Conference.last.id,:user_id => current_user.id)
        @conference=Conference.last
      end
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

end
