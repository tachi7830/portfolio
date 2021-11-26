require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー登録のテスト' do
    it "name,email,password,password_confirmationがあれば登録できる" do
      @user = FactoryBot.build(:user, :a)
      expect(@user).to be_valid
    end
  end

  describe 'バリデーションのテスト' do
    context 'nameカラム' do
      it "nameが2文字以下の場合登録できない" do
        @user = FactoryBot.build(:user, :a, name: nil)
        @user.valid?
        expect(@user.errors[:name]).to include("は2文字以上で入力してください")
      end
      it "nameが2文字以上の場合登録できる" do
        @user = FactoryBot.build(:user, :a, name: "a"*2)
        expect(@user).to be_valid
      end
      it "nameが21文字以上の場合登録できない" do
        @user = FactoryBot.build(:user, :a, name: "a"*21)
        @user.valid?
        expect(@user.errors[:name]).to include("は20文字以内で入力してください")
      end
      it "nameが20文字以下の場合登録できる" do
        @user = FactoryBot.build(:user, :a, name: "a"*20)
        expect(@user).to be_valid
      end
    end
    context 'emailカラム' do
      it "emailが空欄の場合登録できない"  do
        @user = FactoryBot.build(:user, :a, email: nil)
        @user.valid?
        expect(@user.errors[:email]).to include("を入力してください")
      end
    end
    context 'passwordカラム' do
      it "passwordが空欄の場合登録できない" do
        @user = FactoryBot.build(:user, :a, password: nil)
        @user.valid?
        expect(@user.errors[:password]).to include("を入力してください")
      end
       it "passwordとpassword_confirmationが一致しない場合登録できない" do
        @user = FactoryBot.build(:user, :a, password: "aaaaaa",password_confirmation: "bbbbbb")
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
    end
  end
end