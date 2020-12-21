class PropertiesController < ApplicationController
  def index
    if admin?
      @property = Property.where(approved_status: 'false').order('created_at DESC')
    else
      @property = Property.where(approved_status: 'true')
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
    @property = Property.find(params[:id])
    @favourite_exists = Favourite.where(property: @property,user: current_user) == [] ? false : true
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to @property
    else
      render 'edit'
    end
  end

  def create
    @property = Property.new(property_params)
    @property.user = User.first
    if @property.save
      redirect_to @property
    else
      render 'new'
    end
  end

  private
    def property_params
      params.require(:property).permit(:PropertyType, :property_status, :address, :city, :Price, :Area, :OwnerName, :ContactPerson, :Number, :property_image)
    end

end
