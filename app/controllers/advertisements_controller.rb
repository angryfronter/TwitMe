class AdvertisementsController < ApplicationController
  def index
    @ad = Advertisement.all
  end
end