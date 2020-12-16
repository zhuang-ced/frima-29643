class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.integer :category_id
      t.integer :status_id
      t.integer :delivery_fee_id
      t.integer :shipping_area_id
      t.integer :days_to_ship_id
      t.integer :price
      t.references :user
      t.timestamps
    end
  end
end
