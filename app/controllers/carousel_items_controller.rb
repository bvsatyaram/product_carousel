class CarouselItemsController < ApplicationController
  before_action :fetch_shop

  def index
    @carousel_items = CarouselItem.all
  end

  def create
    CarouselItem.find_or_create_by(carousel_item_params)
    @shop.delete_carousel_product_cache

    @carousel_items = @shop.carousel_products
  end

private
  def fetch_shop
    @shop = Shop.first
  end

  def carousel_item_params
    params.require(:carousel_item).permit(:shopify_product_id)
  end
end
