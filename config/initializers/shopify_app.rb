ShopifyApp.configure do |config|
  config.application_name = "Product Carousel"
  config.api_key = ENV['SHOPIFY_API_KEY']
  config.secret = ENV['SHOPIFY_API_SECRET']
  config.scope = "read_orders, read_products, write_script_tags"
  config.embedded_app = true
end
