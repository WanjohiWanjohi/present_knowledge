class CreateFk < ActiveRecord::Migration[7.0]
  def change
    add_column :product_details, :product_id, :string, index: true
    add_reference :registries, :user_id, :int, index: true,
  end
end
