require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@が含まれていない場合登録できない' do
      @user.email = '@'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'password:半角数字(半角数字のみ)' do
      @user.password = '1111111'
      @user.password_confirmation = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end
    it 'family_nameは全角（漢字・ひらがな・カタカナ）以外だと登録できない' do
      @user.family_name = '555555'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end
    it 'family_name_kanaは全角（カタカナ）以外だと登録できない' do
      @user.family_name_kana = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'first_nameは全角（漢字・ひらがな・カタカナ）以外だと登録できない' do
      @user.first_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'first_name_kanaは全角（カタカナ）以外だと登録できない' do
      @user.first_name_kana = 'あああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
