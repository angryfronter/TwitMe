class AdvertisementsController < ApplicationController

  before_action :set_advertisement!,  except: %i[index new create]

  def show
    @comment = @advertisement.comments.build
    @comments = @advertisement.comments.order(created_at: :desc)
  end

  def destroy
    flash[:success] = 'Advertisement deleted!'
    if @advertisement.destroy
      redirect_to advertisements_path
    else
      render :'advertisements/index'
    end
  end

  def edit; end

  def update
    flash[:success] = 'Advertisement updated!'
    if @advertisement.update(advertisement_params)
      redirect_to advertisements_path
    else
      render :edit
    end
  end
  def index
    @advertisements = Advertisement.order(created_at: :desc).page params[:page]
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)
    if @advertisement.save
      flash[:success] = 'Advertisement added!'
      redirect_to advertisements_path
    else
      render :new
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