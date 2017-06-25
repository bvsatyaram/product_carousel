class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  def all_products
    self.with_shopify_session do
      @products = Rails.cache.fetch("shop-#{self.id}-all-products") do
        ShopifyAPI::Product.find(:all, params: {limit: 250, fields: [:id, :title]})
      end
    end

    return @products
  end
end
