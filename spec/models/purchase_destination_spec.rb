require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_destination = FactoryBot.build(:purchase_destination, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@purchase_destination).to be_valid
      end

      it 'building_nameは空でも購入できること' do
        @purchase_destination.building_name = ''
        expect(@purchase_destination).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'tokenが空だと購入できない' do
        @purchase_destination.token = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと購入できない' do
        @purchase_destination.postal_code = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがないと購入できない' do
        @purchase_destination.postal_code = '1234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空だと購入できない' do
        @purchase_destination.prefecture_id = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idで「---」が選択されている場合は購入できない' do
        @purchase_destination.prefecture_id = 1
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと購入できない' do
        @purchase_destination.city = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと購入できない' do
        @purchase_destination.address = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @purchase_destination.phone_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下では購入できない' do
        @purchase_destination.phone_number = '123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上では購入できない' do
        @purchase_destination.phone_number = '012345678912'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが全角数値では購入できない' do
        @purchase_destination.phone_number = '０１２３４５６７８９'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが全角文字では購入できない' do
        @purchase_destination.phone_number = 'ああああああああああ'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが半角文字では購入できない' do
        @purchase_destination.phone_number = 'ｱｱｱｱｱｱｱｱｱｱ'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end

      it 'userが紐づいていなければ出品できない' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていなければ出品できない' do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
