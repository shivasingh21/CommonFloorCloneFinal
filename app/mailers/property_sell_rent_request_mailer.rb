class PropertySellRentRequestMailer < ApplicationMailer
  default from: "shiva297912singh@gmail.com"

  def sell_rent_request_mailer( current_user,property )
    @current_user = current_user
    @property = property
    mail( to: "admin@commonfloor.com", subject: "CommonFloorClone Rails Project Notification Mail" )
  end
end
