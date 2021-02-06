class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :shipping_area_id, :city, :house_number, :building_name, :telephone_number

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/}
    validates :city,  format: { with: /\A[ぁ-んァ-ン一-龥々]/}
    validates :house_number
    validates :telephone_number, numericality: {only_integer: true}
  end

  def save
     order = Order.create!(user_id: user_id , item_id: item_id)
    Address.create!(post_number: post_number, shipping_area_id: shipping_area_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, order_id: order.id)

  end
end
