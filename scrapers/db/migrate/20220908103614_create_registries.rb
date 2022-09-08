class CreateRegistries < ActiveRecord::Migration[7.0]
  def change
    create_table :registries do|t|
      t.integer :registry_id
      t.string :registry_event
      t.integer :user_id
    end
  end
end
