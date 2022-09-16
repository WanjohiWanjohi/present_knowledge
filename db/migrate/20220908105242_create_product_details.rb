class CreateProductDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :product_details ,:id => false do |t|
      t.string  :detail_id, index:true, primary_key:true
      t.string :categories
      t.integer :price_effective
      t.integer :price_full
      t.belongs_to :product, index: true, foreign_key: true
      t.timestamps
      
    end
  end
end
