class CommentsController < ApplicationController

  before_action :set_advertisement!
  before_action :set_comment!, except: :create

  def update
    if @comment.update(comment_params)
      flash[:success] = 'Comment has been updated!'
      redirect_to advertisement_path(@advertisement)
    else
      render :edit
    end
  end

  def edit
  end

  def create
    @comment = @advertisement.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to advertisement_path(@advertisement)
    else
      @comments = @advertisement.comments.order created_at: :desc
      render 'advertisements/show'
    end
  end

  def destroy
    @comment.destroy
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

  def set_comment!
    @comment = @advertisement.comments.find params[:id]
  end
end