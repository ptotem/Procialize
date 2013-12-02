class UserMailer < ActionMailer::Base
  default :from => '"CII - Western Region" <arijit@ptemplar.com>'
  def registration_confirmation(user)
    @invitee=user
    mail(:to => user.email, :subject => "Start interacting with delegates and speakers of CII ENERGY EXPO Now!")
    end
  def msg_confirmation(user)
    @invitee=user
    mail(:to => user.email, :subject => "CII Alerts: Activity on your account")
    end
  def meeting_confirmation(user)
    @invitee=user
    mail(:to => user.email, :subject => "CII Alerts: Activity on your account")
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
