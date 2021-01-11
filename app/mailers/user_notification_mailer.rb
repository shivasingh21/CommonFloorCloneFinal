class UserNotificationMailer < ApplicationMailer

  default from: "shiva297912singh@gmail.com"

  def notification_mailer( current_user,user )
    @current_user = current_user
    @user = user
    mail( to: @user.email, subject: "CommonFloorClone Rails Project Notification Mail" )
  end

end
