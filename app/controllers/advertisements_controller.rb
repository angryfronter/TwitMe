class AdvertisementsController < ApplicationController

  def edit
    @advertisement = Advertisement.find_by id: params[:id]
  end

  def update
    @advertisement = Advertisement.find_by id: params[:id]
    if @advertisement.update advertisement_params
      redirect_to advertisements_path
    else
      render :edit
    end
  end
  def index
    @advertisement = Advertisement.all
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new advertisement_params
    if @advertisement.save
      redirect_to advertisements_path
    else
      render :new
    end
  end

  private
  def advertisement_params
    params.require(:advertisement).permit(:title, :body)
  end
end