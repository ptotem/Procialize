class UserMailer < ActionMailer::Base
  default :from => '"CWIEME - Team Procialize" <arijit@ptemplar.com>'
  def registration_confirmation(user)
    @invitee=user
    mail(:to => user.email, :subject => "Start interacting with delegates and exhibitors at CWIEME 2013 now!!")
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
