class CreateCarouselItems < ActiveRecord::Migration[5.1]
  def change
    create_table :carousel_items do |t|
      t.string :shopify_product_id

      t.timestamps
    end
  end
end
