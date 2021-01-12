class SessionsController < ApplicationController

  def new
    return unless logged_in?

    flash[:warning] = "You have already logged in."
    redirect_to root_path
  end

  def create
    user = User.find_by( email: params[ :session ][ :email ].downcase )
    if user && user.authenticate( params[ :session ][ :password ] )
      session[:user_id] = user.id
      flash[:notice] = " Logged in Successfully "
      redirect_to user
    else
      flash.now[:notice] = " There was something wrong with your login details "
      render "new"
    end
  end

  def social_login
    auth = request.env[ "omniauth.auth" ]
    session[ :omniauth ] = auth.except( "extra" )
    user = User.sign_in_from_omniauth( auth )
    session[ :user_id ] = user.id
    redirect_to user
  end

  def destroy
    session[ :user_id ] = nil
    session[ :omniauth ] = nil
    flash[ :notice ] = " Logged Out "
    redirect_to root_path
  end
end
