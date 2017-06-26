class SlidesController < ApplicationController
  def index
    shopify_domain = params[:shopify_domain]
    shopify_domain = URI.parse(shopify_domain).hostname
    shop = Shop.find_by(shopify_domain: shopify_domain)

    @carousel_products = shop.carousel_products
  end
end
