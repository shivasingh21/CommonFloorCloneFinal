class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :admin?, :favourite_text

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def admin?
    if logged_in?
      current_user.admin
    end
  end

  def favourite_text
    return @favourite_exists ? "Unfavourite" : "Favourite"
  end
end
