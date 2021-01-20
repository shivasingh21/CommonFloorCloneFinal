class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :admin?, :favorite_text, :favorite_text_conformation, :redis_add_user_string, :redis_user_count_string, :property_status_list, :check_status, :change_buy_rent_text, :change_property_status_text

  def current_user
    @current_user ||= User.find( session[:user_id] ) if session[:user_id]
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

  def favorite_text_conformation
    return @favorite_exists ? "REMOVE property from" : "ADD property to"
  end

  def authenticate_user
    if logged_in?
      if @user.nil?
        return
      else
        return if current_user.id == @user.id
      end

      flash[:danger] = " Access denied. You don't have access. "
      redirect_to root_path
    else
      flash[:danger] = " Please login with your credential to perform futher actions. "
      redirect_to login_path
    end
  end

  def authenticate_admin
    if logged_in?
      return if admin?

      flash[:danger] = " Access denied. You don't have admin access. "
      redirect_to root_path
    else
      flash[:danger] = " Please login with your credential. "
      redirect_to login_path
    end
  end

  def redis_add_user_string( property )
    return " #{ property.user.id } ( #{ property.user.username } ) "
  end

  def redis_user_count_string( user )
    return " #{ user.id } ( #{ user.username } ) "
  end

  def property_status_list
    return [ "Rental", "Rented" , "Sold", "Sell" ]
  end

  def search_field_text( search_params )
    if search_params[ :property_type ].present?
      @search_field_text_property_type = search_params[ :property_type ]
    else
      @search_field_text_property_type = "None"
    end
    if search_params[ :property_status ].present?
      @search_field_text_property_status = search_params[ :property_status ]
    else
      @search_field_text_property_status = "None"
    end
    if search_params[ :city ].present?
      @search_field_text_city = search_params[ :city ]
    else
      @search_field_text_city = "None"
    end
    if search_params[ :approved_status ].present?
      if search_params[ :approved_status ] == true
        @search_field_text_approved_status = "Approved"
      else
        @search_field_text_approved_status = "Not Approved"
      end
    else
      @search_field_text_approved_status = "None"
    end
    if search_params[ :email ].present?
      @search_field_text_email = search_params[ :email ]
    else
      @search_field_text_email = "None"
    end
  end

  def check_status(property_status)
    return true if ( property_status == "Rental" || property_status == "Sell" )
  end

  def change_buy_rent_text(property_status)
    if property_status == "Sell"
      return "Buy"
    elsif property_status == "Rental"
      return "Rent"
    end
  end

  def change_property_status_text(property_status)
    if property_status == "Sell"
      return "Sold"
    elsif property_status == "Rental"
      return "Rented"
    end
  end

end
