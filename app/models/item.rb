class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  has_one_attached :image

  validates :image, :item_name, :explanation, :category, :status_id, :delivery_fee_id, :shipping_area_id, :days_to_ship_id, :price, presence: true
  validates :item_name, length: { maximum: 40}
  validates :explanation, length: { maximum: 1000}

  with_options numericality: {other_than: 1 } do
    validates :category_id
  end
end
