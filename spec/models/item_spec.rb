require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = build(:item)
    end

    it '全ての情報が正しく入力されていれば出品できること' do
      expect(@item).to be_valid
    end

    it '画像が一枚もないと出品できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空だと出品できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明がないと出品できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it '価格が空だと出品できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が半角数字でなければ出品できないこと' do
      @item.price = "３０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Harf-width number")
    end
    it '価格が300円未満だと出品できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of Setting range")
    end
    it '価格が10000000円以上だと出品できないこと' do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of Setting range")
    end
    it 'カテゴリーが選択されていないと出品できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end
    it '商品の状態が選択されていないと出品できないこと' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition Select")
    end
    it '配送料の負担が選択されていないと出品できないこと' do
      @item.shipping_fee_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status Select")
    end
    it '発送元の地域が選択されていないと出品できないこと' do
      @item.shipping_prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping prefecture Select")
    end
    it '発送までの日数が選択されていないと出品できないこと' do
      @item.shipping_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day Select")
    end
  end
end
