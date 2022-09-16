class CreateRegistryItem < ActiveRecord::Migration[7.0]
  def change
    create_table:registry_items do |t|
      t.integer :item_id, :null => false
      t.string :product_id
      t.string :registry_id, :null => false
    end
  end
end
