class Admin::CarouselItemsController < ShopifyApp::AuthenticatedController
  def index
    @carousel_items = current_shop.carousel_items.all
  end

  def create
    current_shop.carousel_items.find_or_create_by(carousel_item_params)
    delete_cache_and_fetch_carousel_products
  end

  def destroy
    carousel_item = current_shop.carousel_items.find(params[:id])
    carousel_item.destroy
    delete_cache_and_fetch_carousel_products
  end

private
  def carousel_item_params
    params.require(:carousel_item).permit(:shopify_product_id)
  end

  def delete_cache_and_fetch_carousel_products
    current_shop.delete_carousel_product_cache
    @carousel_products = current_shop.carousel_products
    @grouped_carousel_items = current_shop.carousel_items.group_by(&:shopify_product_id)
  end
end
