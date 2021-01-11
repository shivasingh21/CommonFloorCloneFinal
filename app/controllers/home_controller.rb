class HomeController < ApplicationController

  def index
    @property_top_picks = Property.top_picks
    @property_most_recent = Property.most_recent
    @property_count = Property.count
    @users_count = User.users_count
  end

end
