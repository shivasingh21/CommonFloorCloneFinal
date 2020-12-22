class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @category = Category.all
    if admin?
      @property = Property.where(approved_status: 'false').order('created_at DESC')
    else
      @property = Property.property_search(params)
      # @property = Property.where(approved_status: 'true')
    end
  end

  def new
    @property = Property.new
  end

  def approve
    @property = Property.find(params[:id])
    if @property.update(approved_status: "true")
      flash[:notice] = "New property approved"
      redirect_to properties_path
    end
  end
  def show
    if current_user.id != @property.user.id
      UserNotificationMailer.notification_mailer(current_user,@property.user).deliver
    end
    
    @comment = Comment.new
    @comments = @property.comments.order("created_at DESC")

    # @favourite_exists = Favourite.where(property: @property,user: current_user) == [] ? false : true
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to @property
    else
      render 'edit'
    end
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      redirect_to @property
    else
      render 'new'
    end
  end

  private
    def property_params
      params.require(:property).permit(:property_type, :property_status, :address, :city, :price, :area, :owner_name, :contact_person, :phone_number, :property_image)
    end
    def set_property
      @property = Property.find(params[:id])
    end

end
