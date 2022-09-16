class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, :id => false do |t|
      t.string  :product_id, index:true, primary_key:true
      t.string  :product_name
      t.string  :product_description
      t.string  :vendor
      t.string  :product_url
      t.string  :product_image_url
      t.timestamps
      t.belongs_to :registry, index: true, foreign_key: true
    end
  end
end
