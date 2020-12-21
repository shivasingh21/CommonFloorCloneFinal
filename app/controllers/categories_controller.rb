class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end
  def new
    @category = Category.new
  end
  def edit
    @category = Category.find(params[:id])
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category is Add Successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category is Updated Successfully"

      redirect_to categories_path
    else
      render 'edit'
    end
  end
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:danger] = "Category is Deleted"

    redirect_to categories_path
  end
  private
  def category_params
    params.require(:category).permit(:name)
  end


end
