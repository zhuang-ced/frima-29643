require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    
    context "ユーザーが保存できる場合" do
      it "全ての値が正常であれば登録できる" do
        expect(@user).to be_valid
      end
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailは一意性で無いと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは＠を含ま無いと登録できない' do
      @user.email = '1111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordは６文字以上でないと登録できない' do
      @user.password = '1a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは半角英数混同で無いと登録できない'do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordは確認のため二回入力しないと登録できない' do
      @user.password = '111aaa'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '確認用passwordは一致しないと登録できない' do
      @user.password = '111aaa'
      @user.password_confirmation = '222bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'firstnameは全角（漢字・ひらがな・カタカナ）で無いと登録できない' do
      @user.first_name = 'abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'lastnameは全角（漢字・ひらがな・カタカナ）で無いと登録できない' do
      @user.last_name = 'abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameのフリガナは全角（カタカナ）で無いと登録できない' do
      @user.lastname_kana = 'ああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kana is invalid")
    end
    it 'first_nameのフリガナは全角（カタカナ）で無いと登録できない' do
      @user.firstname_kana = 'ああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana is invalid")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
