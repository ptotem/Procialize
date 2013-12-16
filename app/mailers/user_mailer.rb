class UserMailer < ActionMailer::Base
  default :from => '"CII - Team Procialize" <arijit@ptemplar.com>'
  def registration_confirmation(user)
    @invitee=user
    mail(:to => user.email, :subject => "Start networking at CII's Health and Hospital Tech 2013 Now!")
  end
  def msg_confirmation(user)
    @invitee=user
    mail(:to => user.email, :subject => "CII Alerts: Activity on your account")
    end
  def meeting_confirmation(user)
    @invitee=user
    mail(:to => user.email, :subject => "CII Alerts: Activity on your account")
  end
end
