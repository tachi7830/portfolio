class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :image, null: false
      t.string :news, null: false
      t.string :url, null: false
      t.string :area, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :opening_hour, null: false
      t.string :closed_day, null: false
      t.timestamps
    end
  end
end
