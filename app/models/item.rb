class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name, :explanation, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :days_to_ship_id, :price, presence: true
  validates :item_name, length: { maximum: 40}
  validates :explanation, length: { maximum: 1000}
end
