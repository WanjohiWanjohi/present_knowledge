class RemoveRegistry < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_details, :product_id, :integer
    remove_column :products, :registry_id, :integer
  end
end
