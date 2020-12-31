class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :admin?, :favorite_text, :redis_add_user_string, :redis_user_count_string

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

  def favorite_text
    return @favorite_exists ? "Unfavorite" : "Favorite"
  end

  def authenticate_user
    return if logged_in?

    flash[:danger] = "Please login with your credential."
    redirect_to login_path
  end

  def authenticate_admin
    if logged_in?
      return if admin?

      flash[:danger] = "Access denied. You don't have admin access."
      redirect_to root_path
    else
      flash[:danger] = "Please login with your credential."
      redirect_to login_path
    end
  end

  def redis_add_user_string(property)
    return "#{property.user.id} (#{ property.user.username})"
  end

  def redis_user_count_string(user)
    return "#{user.id}(#{user.username})"
  end
end
