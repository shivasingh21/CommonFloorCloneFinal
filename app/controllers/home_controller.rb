class HomeController < ApplicationController
  def index
    @property_first = Property.first(3)
    @property_last = Property.order("created_at DESC").last(3)
  end
end
