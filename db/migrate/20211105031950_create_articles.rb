class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :user_id, null: false
      t.integer :shop_id, null: false
      t.string :prefecture_code, null: false
      t.json :images, null: false
      t.string :bread_name, null: false
      t.text :review, null: false
      t.float :rate, null: false, default: 0
      t.timestamps
    end
  end
end
