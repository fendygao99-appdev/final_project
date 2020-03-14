class CreateFurnitures < ActiveRecord::Migration[6.0]
  def change
    create_table :furnitures do |t|
      t.string :item
      t.string :original_brand
      t.string :category
      t.string :condition
      t.integer :owner_id
      t.integer :price
      t.boolean :is_available
      t.string :image

      t.timestamps
    end
  end
end
