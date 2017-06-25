class Admin::ShopifyProductsController < ShopifyApp::AuthenticatedController
  def index
    products = current_shop.all_products

    processed_products = []
    if params[:term]
      products.select do |prod|
        processed_products.push({id: prod.id, value: prod.title}) if prod.title.downcase.include?(params[:term].to_s.downcase)
      end
    end

    render json: processed_products
  end
end
