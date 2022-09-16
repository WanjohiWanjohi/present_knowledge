class CreateRegistries < ActiveRecord::Migration[7.0]
  def change
    create_table :registries, :id => false do|t|
      t.string  :registry_id, index:true, primary_key:true
      t.integer :name
      t.string :event
      t.timestamps
      t.belongs_to :user, index: true, foreign_key: true

    end
  end
end
