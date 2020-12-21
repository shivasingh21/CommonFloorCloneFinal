class CommentsController < ApplicationController
  before_action :set_property
  def create
    @comment = @property.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      # redirect_back(fallback_location: root_path)
      redirect_to property_path(@property)
    else
      flash[:danger] = "Errors:- Rating should be between 0 to 5 OR/AND Rating/Comment field is empty "
      redirect_to property_path(@property)
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:rating,:comment,:post_id)
  end

  def set_property
    @property = Property.find(params[:property_id])
  end
end
