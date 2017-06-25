class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  PRODUCT_FIELDS = [:id, :title, :images, :product_type]

  def all_products
    self.with_shopify_session do
      @all_products = Rails.cache.fetch(product_cache_name(:all)) do
        ShopifyAPI::Product.find(:all, params: {limit: 250, fields: PRODUCT_FIELDS})
      end
    end

    return @all_products
  end

  def carousel_products
    product_ids = CarouselItem.pluck(:shopify_product_id).join(",")
    return [] if product_ids.empty?
    
    self.with_shopify_session do
      @carousel_products = Rails.cache.fetch(product_cache_name(:carousel)) do
        ShopifyAPI::Product.find(:all, params: {ids: product_ids, limit: 250, fields: PRODUCT_FIELDS})
      end
    end

    return @carousel_products
  end

  def delete_all_product_cache
    Rails.cache.delete(product_cache_name(:all))
  end

  def delete_carousel_product_cache
    Rails.cache.delete(product_cache_name(:carousel))
  end

private
  # `product_scope` can be `:all` or `:carousel`
  def product_cache_name(product_scope)
    "shop-#{self.id}-#{product_scope.to_s}-products"
  end
end
