class UserMailer < ActionMailer::Base
  default :from => '"CII - Team Procialize" <arijit@ptemplar.com>'
  def registration_confirmation(user)
    @invitee=user
    mail(:to => user.email, :subject => "Start interacting with delegates and speakers of CII PHARMA SUMMIT Now!")
    end
  def msg_confirmation(user)
    @invitee=user
    mail(:to => user.email, :subject => "Message Received")
    end
  def meeting_confirmation(user)
    @invitee=user
    mail(:to => user.email, :subject => "Meeting Invitation Received")
  end

  #def unapproval_notice(user)
  #  @user=user
  #  mail(:to => user.email, :subject => "Account Void")
  #end
  #
  #def approval_notice(user)
  #  @user=user
  #  mail(:to => user.email, :subject => "Account Approved by Administrator")
  #end
end
