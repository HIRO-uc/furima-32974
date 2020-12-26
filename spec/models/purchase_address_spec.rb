require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = build(:purchase_address)
  end

  context '出品機能が正常に動作するとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @purchase_address.building_name = nil
      expect(@purchase_address).to be_valid
    end
  end

  context '出品機能が正常に動作しないとき' do
    it 'tokenが空だと保存できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeがハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
    end
    it 'postal_codeが全角数字だと登録できないこと' do
      @purchase_address.postal_code = '１２３−４５６７'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
    end
    it 'shipping_prefectureを選択していないと保存できないこと' do
      @purchase_address.shipping_prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Shipping prefecture Select')
    end
    it 'cityが空だと保存できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @purchase_address.house_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'telが空だと保存できないこと' do
      @purchase_address.tel = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Tel can't be blank")
    end
    it 'telがハイフンを含んでいると登録できないこと' do
      @purchase_address.tel = '090-1234-5678'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Tel Input only half-width number')
    end
    it 'telが全角数字だと登録できないこと' do
      @purchase_address.tel = '０９０１２３４５６７８'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Tel Input only half-width number')
    end
  end
end
