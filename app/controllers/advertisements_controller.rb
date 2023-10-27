class AdvertisementsController < ApplicationController

  before_action :set_advertisement,  except: %i[index new create]

  def show; end

  def destroy
    if @advertisement.destroy
      redirect_to advertisements_path
    else
      render :'advertisements/index'
    end
  end

  def edit; end

  def update
    if @advertisement.update(advertisement_params)
      redirect_to advertisements_path
    else
      render :edit
    end
  end
  def index
    @advertisements = Advertisement.all
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    if @advertisement.save
      redirect_to advertisements_path
    else
      render :new
    end
  end

  private

  def set_advertisement
    @advertisement = Advertisement.find(params[:id])
  end

  def advertisement_params
    params.require(:advertisement).permit(:title, :body)
  end

end