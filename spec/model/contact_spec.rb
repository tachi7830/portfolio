require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'お問合せのテスト' do
    it "name,email,messageがあれば登録できる" do
      @contact = FactoryBot.build(:contact)
      expect(@contact).to be_valid
    end
  end
  describe 'バリデーションのテスト' do
    context 'nameカラム' do
      it "nameが空欄の場合登録できない" do
        @contact = FactoryBot.build(:contact, name: nil)
        @contact.valid?
        expect(@contact.errors[:name]).to include("を入力してください")
      end
    end
    context 'emailカラム' do
      it "emailが空欄の場合登録できない" do
        @contact = FactoryBot.build(:contact, email: nil)
        @contact.valid?
        expect(@contact.errors[:email]).to include("を入力してください")
      end
    end
    context 'messageカラム' do
      it "messageが空欄の場合登録できない" do
        @contact = FactoryBot.build(:contact, message: nil)
        @contact.valid?
        expect(@contact.errors[:message]).to include("を入力してください")
      end
      it 'messageが200文字以下の場合登録できる' do
        @contact = FactoryBot.build(:contact, message: "a"*200)
        expect(@contact).to be_valid
      end
      it 'messageが201文字以上の場合登録できない' do
        @contact = FactoryBot.build(:contact, message: "a"*201)
        @contact.valid?
        expect(@contact.errors[:message]).to include("は200文字以内で入力してください")
      end
    end
  end
end