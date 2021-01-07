class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_image,        null:false
      t.string :name,              null:false
      t.string :explanation,       null:false
      t.string :category_id,       null:false
      t.string :status_id,         null:false
      t.string :delivery_fee_id,   null:false
      t.string :shipping_area_id,  null:false
      t.string :days_to_ship_id,   null:false
      t.string :price,             null:false
      t.string :user,              null:false
      t.timestamps
    end
  end
end
