class CreateRegistryItem < ActiveRecord::Migration[7.0]
  def change
    create_table:registry_items do |t|
      t.integer :item_id, :null => false
      t.belongs_to :registry, index: true, foreign_key: true
    end
  end
end
