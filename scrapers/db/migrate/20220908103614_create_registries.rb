class CreateRegistries < ActiveRecord::Migration[7.0]
  def change
    create_table :registries do|t|
      t.integer :name
      t.string :event
      t.integer :user_id
      t.timestamps
    end
  end
end
