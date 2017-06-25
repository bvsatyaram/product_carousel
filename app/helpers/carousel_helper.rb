module CarouselHelper
  def shopify_product_image(shopify_product, thumbnail = false)
    src = shopify_product.images.first.src
    if thumbnail
      extension_part = src.match(/(\.[^.]+\?v=)/)[0]
      src.gsub!(extension_part, "_thumb#{extension_part}")
    end

    return src
  end
end
