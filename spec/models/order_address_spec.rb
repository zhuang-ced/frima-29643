require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }
    before do
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

  describe '商品購入機能' do
    context '商品を購入できる場合' do
      it '全ての値が正常であれば購入できる' do
        expect(@order_address).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it 'post_numberが空だと購入できない' do
        @order_address.post_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number can't be blank", "Post number is invalid")
      end
      it 'post_numberにハイフンが含まれないと購入できない' do
        @order_address.post_number = 1234567
        expect(@order_address.errors.full_messages).to include("Post number is invalid")
      end
      it 'shipping_area_idが1だと購入できない' do
        @order_address.shipping_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it 'cityが空だと購入できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank", "City is invalid")
      end
      it 'house_numberが空だと購入できない' do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

    end
  end
end