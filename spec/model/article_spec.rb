require 'rails_helper'

RSpec.describe Article, type: :model do

  describe '記事登録のテスト' do
    it "user_id,shop_id,prefecture_code,images,bread_name,review,rateがあれば登録できる"do
      @user = FactoryBot.create(:user, :a)
      @article = FactoryBot.build(:article)
      expect(@article).to be_valid
    end
  end

  describe 'バリデーションのテスト' do
    context 'shop_idカラム' do
      it "shop_idが空欄の場合登録できない" do
        @article = FactoryBot.build(:article, shop_id: nil)
        @article.valid?
        expect(@article.errors[:shop_id]).to include("を入力してください")
      end
    end
    context 'prefecture_codeカラム' do
      it "prefecture_codeが空欄の場合登録できない" do
        @article = FactoryBot.build(:article, prefecture_code: nil)
        @article.valid?
        expect(@article.errors[:prefecture_code]).to include("を入力してください")
      end
    end
    context 'imagesカラム' do
      it "imagesが空欄の場合登録できない" do
        @article = FactoryBot.build(:article, images: nil)
        @article.valid?
        expect(@article.errors[:images]).to include("を入力してください")
      end
    end
    context 'bread_nameカラム' do
      it "bread_nameが空欄の場合登録できない" do
        @article = FactoryBot.build(:article, bread_name: nil)
        @article.valid?
        expect(@article.errors[:bread_name]).to include("を入力してください")
      end
      it "bread_nameが31文字以上の場合登録できない" do
        @article = FactoryBot.build(:article, bread_name: "a"*31)
        @article.valid?
        expect(@article.errors[:bread_name]).to include("は30文字以内で入力してください")
      end
      it "bread_nameが30文字以下の場合登録できる" do
        @user = FactoryBot.create(:user, :a)
        @article = FactoryBot.build(:article, bread_name: "a"*30)
        expect(@article).to be_valid
      end
    end
    context 'reviewカラム' do
      it "reviewが空欄の場合登録できない" do
        @article = FactoryBot.build(:article, review: nil)
        @article.valid?
        expect(@article.errors[:review]).to include("を入力してください")
      end
      it "reviewが201文字以上の場合登録できない" do
        @article = FactoryBot.build(:article, review: "a"*201)
        @article.valid?
        expect(@article.errors[:review]).to include("は200文字以内で入力してください")
      end
      it "reviewが200文字以下の場合登録できる" do
        @user = FactoryBot.create(:user, :a)
        @article = FactoryBot.build(:article, review: "a"*200)
        expect(@article).to be_valid
      end
    end
    context 'rateカラム' do
      it "rateが空欄の場合登録できない" do
        @article = FactoryBot.build(:article, rate: nil)
        @article.valid?
        expect(@article.errors[:rate]).to include("を入力してください")
      end
    end
  end
end