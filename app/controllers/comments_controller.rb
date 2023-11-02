# frozen_string_literal: true

class CommentsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_advertisement!
  before_action :set_comment!, except: :create

  def edit; end

  def create
    @comment = @advertisement.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Comment added!'
      redirect_to advertisement_path(@advertisement)
    else
      @advertisement = @advertisement.decorate
      @comments = @advertisement.comments.order created_at: :desc
      @comments = @comments.decorate
      render 'advertisements/show'
    end
  end

  def update
    if @comment.update(comment_params)
      flash[:success] = 'Comment has been updated!'
      redirect_to advertisement_path(@advertisement, anchor: dom_id(@comment))
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment deleted!'
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
