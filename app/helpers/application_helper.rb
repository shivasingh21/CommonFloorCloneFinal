module ApplicationHelper

  def city_selection
    Property.select(:city).distinct
  end
  
end
