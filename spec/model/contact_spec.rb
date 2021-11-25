require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe 'ユーザー登録のテスト' do
    it "name,email,messageがあれば登録できる" do
      @contact = FactoryBot.build(:contact)
      expect(@contact).to be_valid
    end
  end

  describe 'バリデーションのテスト' do
    it "nameが空欄の場合登録できない" do
      @contact = FactoryBot.build(:contact, name: nil)
      @contact.valid?
      expect(@contact.errors[:name]).to include("を入力してください")
    end
    it "emailが空欄の場合登録できない" do
      @contact = FactoryBot.build(:contact, email: nil)
      @contact.valid?
      expect(@contact.errors[:email]).to include("を入力してください")
    end
    it "messageが空欄の場合登録できない" do
      @contact = FactoryBot.build(:contact, message: nil)
      @contact.valid?
      expect(@contact.errors[:message]).to include("を入力してください")
    end
  end
end