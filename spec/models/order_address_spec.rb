require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }
  before do
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '商品購入機能' do
    context '商品を購入できる場合' do
      it '全ての値が正常であれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_address.building_name = ""
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
        @order_address.valid?
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
      it 'telephone_numberが空だと購入できない' do
        @order_address.telephone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが12桁以上では購入できない' do
        @order_address.telephone_number = "1234567890123"
        @order_address.valid?
        expect(@order_address.errors.full_messages). to include("Telephone number is too long (maximum is 12 characters)")
      end
      it 'telephone_numberが英数混合では購入できない' do
        @order_address.telephone_number = "1a2b3c4d5e6"
        @order_address.valid?
        expect(@order_address.errors.full_messages). to include("Telephone number is not a number")
      end
      it 'tokenが空だと購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end