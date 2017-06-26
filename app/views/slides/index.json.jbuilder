json.slides @carousel_products do |slide|
  json.id slide.id
  json.title slide.title
  json.image shopify_product_image(slide)
  json.product_type slide.product_type
  json.handle slide.handle
end
