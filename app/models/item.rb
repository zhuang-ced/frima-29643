class Item < ApplicationRecord
  validates :item_name, :explanation, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :days_to_ship_id, :price true, presence: true
  validates :item_name, length: { maximum: 40}
  validates :explanation, length: { maximum: 1000}
end
