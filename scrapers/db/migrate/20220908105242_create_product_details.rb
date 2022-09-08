class CreateProductDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :product_details do |t|
      t.string :categories
      t.integer :price_effective
      t.integer :price_full
      t.integer :product_id
      t.timestamps
    end
  end
end
