require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: user.id, item_id: @item.id)
    end

    context '商品購入できる場合' do
      it '建物名以外のすべての値が正しく入力されていれば購入できること' do
        expect(@purchase_delivery).to be_valid
      end
      it 'apartmentは空でも購入できること' do
        @purchase_delivery.apartment = ''
        expect(@purchase_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと購入できないこと' do
        @purchase_delivery.postcode = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @purchase_delivery.postcode = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Postcode should be in the format of three digits, a hyphen, and four digits.')
      end
      it 'provinceが空では購入できない' do
        @purchase_delivery.province = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Province can't be blank")
      end
      it 'provinceが1(---)では購入できない' do
        @purchase_delivery.province = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Province can't be blank")
      end
      it 'localityが空では購入できない' do
        @purchase_delivery.locality = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Locality can't be blank")
      end
      it 'blockが空では購入できない' do
        @purchase_delivery.block = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Block can't be blank")
      end
      it 'telephone_numberが空では購入できない' do
        @purchase_delivery.telephone_number = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以下では購入できない' do
        @purchase_delivery.telephone_number = '123456789'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Telephone number is invalid. Input 10-11 digits without any symbols.")
      end
      it 'telephone_numberが12桁以上では購入できない' do
        @purchase_delivery.telephone_number = '1234567891011'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Telephone number is invalid. Input 10-11 digits without any symbols.")
      end
      it 'telephone_numberが半角数値以外では購入できない' do
        @purchase_delivery.telephone_number = '090-1234-5678'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Telephone number is invalid. Input 10-11 digits without any symbols.")
      end
      it 'tokenが空では購入できないこと' do
        @purchase_delivery.token = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと購入できないこと' do
        @purchase_delivery.user_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できないこと' do
        @purchase_delivery.item_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end