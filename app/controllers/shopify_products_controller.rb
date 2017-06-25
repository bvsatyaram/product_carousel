class ShopifyProductsController < ApplicationController
  def index
    products = Shop.first.all_products

    processed_products = []
    if params[:term]
      products.select do |prod|
        processed_products.push({id: prod.id, value: prod.title}) if prod.title.downcase.include?(params[:term].to_s.downcase)
      end
    end

    render json: processed_products
  end
end
