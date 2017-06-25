class CarouselController < ApplicationController
  def preview
    @carousel_items = CarouselItem.all
    activate_tab :preview
  end

  def configure
    activate_tab :configure
  end
end
