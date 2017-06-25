class AddShopToCarouselItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :carousel_items, :shop, foreign_key: true
  end
end
