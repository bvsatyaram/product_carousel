class ProductsUpdateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      shop.delete_all_product_cache
      if shop.carousel_items.where(shopify_product_id: webhook["id"]).any?
        shop.delete_carousel_product_cache
      end
    end
  end
end
