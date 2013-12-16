class UserMailer < ActionMailer::Base
  default :from => 'procialize@gmail.com'
  def registration_confirmation(user)
    @invitee=user
    mail(:to => user.email, :subject => " Solstice 2013. Connect with 500+ alumni now!")
  end
  def msg_confirmation(user)
    @invitee=user
    mail(:to => user.email, :subject => "ISB Alerts: An alumni wants to get in touch with you")
    end
  def meeting_confirmation(user)
    @invitee=user
    mail(:to => user.email, :subject => "ISB Alerts: An alumni wants to meet you")
  end
end
