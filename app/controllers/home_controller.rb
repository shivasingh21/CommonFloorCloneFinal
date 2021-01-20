class HomeController < ApplicationController

  def index
    @property_top_picks = Property.top_picks
    @property_count = Property.where(approved_status: true).count
    @users_count = User.users_count

    @category = Category.all
    @user = User.all
    if admin?
      @property = Property.admin_property_list(params)
    else
      @property = Property.users_property_list(params)
    end
    search_field_text(params)
  end

end
