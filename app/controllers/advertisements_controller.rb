# frozen_string_literal: true

class AdvertisementsController < ApplicationController
  include AdvertisementsComments
  before_action :require_authentication, except: %i[show index]
  before_action :set_advertisement!, only: %i[show destroy edit update]
  before_action :fetch_tags, only: %i[new edit]
  before_action :authorize_advertisement!
  after_action :verify_authorized

  def index
    page = params[:page] || 1
    per_page = 10
    @advertisements = Advertisement.all_by_tags(params[:tag_ids], page, per_page)
    @show_pagination = @advertisements.total_pages > 1
    @tags = Tag.all
  end

  def show
    load_advertisement_comments
  end

  def new
    @advertisement = Advertisement.new
  end

  def edit; end

  def create
    fetch_tags
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
    params.require(:advertisement).permit(:title, :body, tag_ids: [])
  end

  def fetch_tags
    @tags = Tag.all
  end

  def authorize_advertisement!
    authorize(@advertisement || Advertisement)
  end
end
