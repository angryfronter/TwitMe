class CommentsController < ApplicationController

  before_action :set_advertisement!
  def create
    @comment = @advertisement.comments.build(comment_params)

    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to advertisement_path(@advertisement)
    else
      @comments = Comment.order created_at: :desc
      render 'advertisements/show'
    end
  end

  def destroy
    comment = @advertisement.comments.find params[:id]
    comment.destroy
    flash[:success] = "Comment deleted!"
    redirect_to advertisement_path(@advertisement)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_advertisement!
    @advertisement = Advertisement.find params[:advertisement_id]
  end
end