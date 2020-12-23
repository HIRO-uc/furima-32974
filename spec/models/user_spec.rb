require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = build(:user)
    end

    it '全ての情報が正しく入力されていれば登録できること' do
      expect(@user).to be_valid
    end
    it 'passwordが半角英数混合6文字以上であれば登録できること' do
      @user.password = 'aaa123'
      @user.password_confirmation = 'aaa123'
      expect(@user).to be_valid
    end
    it '名前が全角であれば登録できること' do
      @user.last_name = '山田'
      @user.first_name = '太郎'
      expect(@user).to be_valid
    end
    it '名前カナが全角カタカナであれば登録できること' do
      @user.last_name = 'ヤマダ'
      @user.first_name = 'タロウ'
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'Emailが空だと登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'Emailに@が含まれていないと登録できないこと' do
      @user.email = 'aaa123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it '同じEmailは登録できないこと' do
      another_user = create(:user)
      @user.email = another_user.email
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordが空だと登録できないこと' do
      @user.password = nil
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが六文字以上でないと登録できないこと' do
      @user.password = 'aaa12'
      @user.password_confirmation = 'aaa12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordとpassword_confirmationが一致していないと登録できないこと' do
      @user.password = 'aaa123'
      @user.password_confirmation = 'bbb123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが英数混合でないと登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it '名前とフリガナが空だと登録できないこと' do
      @user.last_name = nil
      @user.first_name = nil
      @user.last_name_kana = nil
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name kana can't be blank", "Last name can't be blank", "Last name kana can't be blank")
    end
    it '名前が全角でないと登録できないこと' do
      @user.last_name = 'Pitt'
      @user.first_name = 'Brad'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters", "First name Full-width characters")
    end
    it '名前カナが全角カタカナでないと登録できないこと' do
      @user.last_name_kana = 'やまだ'
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters", "First name kana Full-width katakana characters")
    end

    it '生年月日が空だと登録できないこと' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
