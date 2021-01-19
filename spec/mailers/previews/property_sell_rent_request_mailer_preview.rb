# Preview all emails at http://localhost:3000/rails/mailers/property_sell_rent_request_mailer
class PropertySellRentRequestMailerPreview < ActionMailer::Preview
  def sell_rent_request_mailer_preview
    PropertySellRentRequestMailer.sell_rent_request_mailer("admin",Property.first)
  end
end
