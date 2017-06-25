class CarouselController < ApplicationController
  before_action :fetch_carousel_items

  def preview
    activate_tab :preview
  end

  def configure
    activate_tab :configure
  end

private
  def fetch_carousel_items
    @carousel_items = CarouselItem.all
  end
end
