# frozen_string_literal: true

class AdvertisementsController < ApplicationController
  before_action :set_advertisement!, except: %i[index new create]

  def index
    @advertisements = Advertisement.order(created_at: :desc).page params[:page]
    @show_pagination = @advertisements.total_pages > 1
  end

  def show
    @comment = @advertisement.comments.build
    @comments = @advertisement.comments.order(created_at: :desc).decorate
  end

  def new
    @advertisement = Advertisement.new
  end

  def edit; end

  def create
    @advertisement = current_user.advertisements.build(advertisement_params)
    if @advertisement.save
      flash[:success] = 'Advertisement added!'
      redirect_to advertisements_path
    else
      render :new
    end
  end

  def update
    flash.now[:success] = 'Advertisement updated!'
    if @advertisement.update(advertisement_params)
      redirect_to advertisements_path
    else
      render :edit
    end
  end

  def destroy
    flash.now[:success] = 'Advertisement deleted!'
    if @advertisement.destroy
      redirect_to advertisements_path
    else
      render :'advertisements/index'
    end
  end

  private

  def set_advertisement!
    @advertisement = Advertisement.find(params[:id])
  end

  def advertisement_params
    params.require(:advertisement).permit(:title, :body)
  end
end
