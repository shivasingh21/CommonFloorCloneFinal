class UsersController < ApplicationController

  before_action :set_user, only: [ :show, :edit, :update ]
  before_action :authenticate_user

  def new
    if logged_in?
      flash[:warning] = "You have already logged in."
      redirect_to root_path
      return
    end
    
    @user = User.new
  end

  def edit
  end

  def show
  end

  def create
    @user = User.new( user_params )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = " Hello,  #{ @user.username } "
      redirect_to properties_path
    else
      render "new"
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = " ACCOUNT IS UPDATED "
      redirect_to properties_path
    else
      render "edit"
    end
  end

  private

    def user_params
      params.require( :user ).permit( :username, :email, :password, :password_confirmation )
    end

    def set_user
        @user = User.find( params[:id] )
    end

end
