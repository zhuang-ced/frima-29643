class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_number,         defalt:"",   null:false
      t.integer :shipping_area_id,                null:false
      t.string :city,                defalt:"",   null:false
      t.string :house_number,        defalt:"" ,  null:false
      t.string :building_name,       defalt:""
      t.string :telephone_number,    defalt:"",   null:false
      t.references :order,           null:false, foreign_key: true
      t.timestamps
    end
  end
end
