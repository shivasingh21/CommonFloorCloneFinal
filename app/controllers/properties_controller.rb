class PropertiesController < ApplicationController

  before_action :set_property, only: [ :show, :edit, :update, :destroy, :approve, :change_property_status, :property_sell_rent_request ]
  before_action :authenticate_user, except: [ :index ]
  after_action :set_stop_mailer_flag, only: [ :show ]


  def index
    @category = Category.all
    @user = User.all
    if admin?
      @property = Property.admin_property_list(params)
    else
      @property = Property.users_property_list(params)
    end
    search_field_text(params)

  end

  def new
    @property = Property.new
  end

  def approve
    if @property.update( approved_status: "true" )
      flash[:notice] = " New property approved "
      redirect_to properties_path
    end
  end

  def change_property_status
    if @property.property_status == "Sell" && @property.update( property_status: "Sold",sold_or_rent_to_user_id: params[:user])
      change_property_status_flash_message_and_redirect()
    elsif @property.property_status == "Rental" && @property.update( property_status: "Rented", sold_or_rent_to_user_id: params[:user] )
      change_property_status_flash_message_and_redirect()
    end

  end

  def property_sell_rent_request
    property_purchase_detail = PropertyPurchaseDetail.where( property: @property, user: current_user )
    if property_purchase_detail == []
      PropertyPurchaseDetail.create( property: @property, user: current_user )
      PropertySellRentRequestMailer.sell_rent_request_mailer( current_user,@property ).deliver
      flash[:notice] = "Request mail to Buy/Rent property has been send to Admin "
    else
      flash[:notice] = "You have already requested to Buy/Rent this property"
    end

    redirect_to property_path( params[:id] )
  end

  def show
    # $stop_mailer_flag variable is defined so that when show page is reloaded when comment or favorite action is performed in that case
    # again mail is not send.

    if ( $stop_mailer_flag.nil? || $stop_mailer_flag ) && ( logged_in? ) && ( current_user.id != @property.user.id )
      UserNotificationMailer.notification_mailer( current_user,@property.user ).deliver
    end

    @comment = Comment.new
    @comments = @property.comments.order( "created_at DESC" )

    @favorite_exists = Favorite.where( property: @property,user: current_user ) == [] ? false : true

    @property_purchase_detail = PropertyPurchaseDetail.where( property: @property )

  end

  def edit
  end

  def update
    if @property.update( property_params )
      redirect_to @property
    else
      render "edit"
    end
  end

  def create
    @property = Property.new( property_params )
    @property.user = current_user
    if @property.save
      redirect_to @property
    else
      render "new"
    end
  end

  def destroy
    @property = Property.find( params[:id] )
    @temp_user = @property.user
    @property.destroy

    redirect_to user_path( @temp_user )
  end

  private

    def property_params
      params.require( :property ).permit( :property_type, :property_status, :address, :city, :price, :area, :owner_name, :contact_person, :phone_number, :property_image )
    end

    def set_property
      @property = Property.find( params[:id] )
    end

    def set_stop_mailer_flag
      $stop_mailer_flag = true
    end

    def change_property_status_flash_message_and_redirect
      flash[:notice] = " New property status changed to #{ @property.property_status } "
      redirect_to property_path(params[:id])
    end

end
