module AdvertisementsComments
  extend ActiveSupport::Concern

  included do
    def load_advertisement_comments(do_render: false)
      @advertisement = @advertisement.decorate
      @comment ||= @advertisement.comments.build
      @comments = @advertisement.comments.order(created_at: :desc).decorate
      render('advertisements/show') if do_render
    end
  end
end