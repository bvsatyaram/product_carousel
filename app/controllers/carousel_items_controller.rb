class CarouselItemsController < ApplicationController
  def index
    @carousel_items = CarouselItem.all
  end
end
