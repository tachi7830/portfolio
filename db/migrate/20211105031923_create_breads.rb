class CreateBreads < ActiveRecord::Migration[5.2]
  def change
    create_table :breads do |t|
      t.integer :shop_id, null: false
      t.string :name, null: false
      t.string :image_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
