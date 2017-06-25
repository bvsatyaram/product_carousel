class CarouselItemsController < ApplicationController
  before_action :fetch_shop

  def index
    @carousel_items = CarouselItem.all
  end

  def create
    CarouselItem.find_or_create_by(carousel_item_params)
    delete_cache_and_fetch_carousel_products
  end

  def destroy
    carousel_item = CarouselItem.find(params[:id])
    carousel_item.destroy
    delete_cache_and_fetch_carousel_products
  end

private
  def fetch_shop
    @shop = Shop.first
  end

  def carousel_item_params
    params.require(:carousel_item).permit(:shopify_product_id)
  end

  def delete_cache_and_fetch_carousel_products
    @shop.delete_carousel_product_cache
    @carousel_products = @shop.carousel_products
    @grouped_carousel_items = CarouselItem.all.group_by(&:shopify_product_id)
  end
end
