class FavoritesController < ApplicationController
  def update
    favorite = Favorite.where(property: Property.find(params[:property]), user: current_user)
    if favorite == []
      Favorite.create(property: Property.find(params[:property]), user: current_user)
      @favorite_exists = true
    else
      favorite.destroy_all
      @favorite_exists = false
    end
    redirect_to property_path(Property.find(params[:property]))
  end
end
