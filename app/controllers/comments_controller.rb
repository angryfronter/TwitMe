# frozen_string_literal: true

class CommentsController < ApplicationController
  include AdvertisementsComments
  include ActionView::RecordIdentifier

  before_action :set_advertisement!
  before_action :set_comment!, except: :create
  before_action :authorize_comment!
  after_action :verify_authorized

  def edit; end

  def create
    @comment = @advertisement.comments.build(comment_create_params)
    if @comment.save
      flash[:success] = 'Comment added!'
      redirect_to advertisement_path(@advertisement)
    else
      load_advertisement_comments(do_render: true)
    end
  end

  def update
    if @comment.update(comment_update_params)
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

  def comment_create_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

  def comment_update_params
    params.require(:comment).permit(:body)
  end

  def set_advertisement!
    @advertisement = Advertisement.find params[:advertisement_id]
  end

  def set_comment!
    @comment = @advertisement.comments.find params[:id]
  end

  def authorize_comment!
    authorize(@comment || Comment)
  end
end
