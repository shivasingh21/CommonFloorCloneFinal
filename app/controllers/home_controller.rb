class HomeController < ApplicationController

  def index
    @property_first = Property.where( approved_status: "true" ).first( 3 )
    @property_last = Property.where( approved_status: "true" ).last( 3 )
    @property_count = Property.count
    @users_count = User.where( admin: "false" ).count
  end

end
