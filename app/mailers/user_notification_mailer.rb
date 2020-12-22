class UserNotificationMailer < ApplicationMailer
  default from: "shiva297912singh@gmail.com"

  def notification_mailer(current_user,user)
    @current_user = current_user
    @user = user
    mail(to: @user.email, subject: 'Rails Project Notification Mail from CommonFloor')
  end
end
