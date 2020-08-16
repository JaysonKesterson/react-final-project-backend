class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image_url
      t.integer :store_id
      t.decimal :price
      t.string :name
      t.string :description
      t.integer :condition

      t.timestamps
    end
  end
end
