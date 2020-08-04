class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :store_id
      t.string :price
      t.string :name
      t.string :description
      t.string :condition

      t.timestamps
    end
  end
end
