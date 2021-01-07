class Item < ApplicationRecord
  validates :item_image, :name, :explanation, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :days_to_ship_id, :price, :user ,presence: true
end
