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
    shop = Shop.first
    @carousel_products = shop.carousel_products
    @grouped_carousel_items = CarouselItem.all.group_by(&:shopify_product_id)
  end
end
