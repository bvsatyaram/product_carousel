ShopifyApp.configure do |config|
  config.application_name = "Product Carousel"
  config.api_key = ENV['SHOPIFY_API_KEY']
  config.secret = ENV['SHOPIFY_API_SECRET']
  config.scope = "read_orders, read_products, write_script_tags"
  config.embedded_app = true
  config.scripttags = [
    {event: 'onload', src: 'https://b5b4c70a.ngrok.io/script-tags/carousel-mounter.js'}
  ]
  config.webhooks = [
    {topic: 'products/delete', address: 'https://b5b4c70a.ngrok.io/webhooks/products_delete', format: 'json'},
    {topic: 'products/update', address: 'https://b5b4c70a.ngrok.io/webhooks/products_update', format: 'json'},
    {topic: 'products/create', address: 'https://b5b4c70a.ngrok.io/webhooks/products_create', format: 'json'},
  ]
end
