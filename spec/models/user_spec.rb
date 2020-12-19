require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードが６文字以上出ないと登録できない"do
      user = FactoryBot.build(:user)
      user.password = "1a"
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "メールアドレスが一意性で無いと登録できない" do
      user = FactoryBot.build(:user)
      user.save
      another_user = FactoryBot.build(:user,email: user.email)
      # another_user.email = user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "ユーザー姓は全角（漢字・ひらがな・カタカナ）で入力" do
      user = FactoryBot.build(:user)
      user.lastname_kana = "abcd"
      user.valid?
      expect(user.errors.full_messages).to include("Lastname kana is invalid")
    end
    it "ユーザー名のフリガナは全角（カタカナ）で入力" do
      user = FactoryBot.build(:user)
      user.firstname_kana = "efgh"
      user.valid?
      expect(user.errors.full_messages).to include("Firstname kana is invalid")
    end
  end
end
