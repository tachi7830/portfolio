require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー登録のテスト' do
    it "name,email,password,password_confirmation vaild" do
      @user = FactoryBot.create(:user, :a)
      expect(@user).to be_valid
    end
  end

  describe 'バリデーションのテスト' do
    it "名前が空欄の場合登録できない" do
      @user = FactoryBot.build(:user, :a, name: nil)
      @user.valid?
      expect(@user.errors[:name]).to include("を入力してください")
    end
    it "メールアドレスがない場合、無効である"  do
      @user = FactoryBot.build(:user, :a, email: nil)
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end
    it "重複したメールアドレスの場合、無効である" do
      @user = FactoryBot.create(:user, :a)
      @other_user = FactoryBot.build(:user, :b)
      @other_user.valid?
      expect(@other_user.errors[:email]).to include("")
    end
    it "パスワードがない場合、無効である" do
      @user = FactoryBot.build(:user, :a, password: nil)
      @user.valid?
      expect(@user.errors[:password]).to include("を入力してください")
    end
  end
end