class Admin::CarouselController < ShopifyApp::AuthenticatedController
  before_action :fetch_carousel_items

  def preview
    activate_tab :preview
  end

  def configure
    activate_tab :configure
  end

private
  def fetch_carousel_items
    @carousel_products = current_shop.carousel_products
    @grouped_carousel_items = current_shop.carousel_items.group_by(&:shopify_product_id)
  end
end
