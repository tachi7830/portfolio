require 'rails_helper'

RSpec.describe Article, type: :model do

  describe '記事登録のテスト' do
    it "user_id,shop_id,prefecture_code,images,bread_name,review,rateがあれば登録できる"do
      @user = FactoryBot.create(:user, :a)
      @article = FactoryBot.create(:article)
      expect(@article).to be_valid
    end
  end

  describe 'バリデーションのテスト' do
    it "shop_idがない場合、無効である" do
      @article = FactoryBot.build(:article, shop_id: nil)
      @article.valid?
      expect(@article.errors[:shop_id]).to include("を入力してください")
    end
    it "prefecture_codeがない場合、無効である" do
      @article = FactoryBot.build(:article, prefecture_code: nil)
      @article.valid?
      expect(@article.errors[:prefecture_code]).to include("を入力してください")
    end
    it "imagesがない場合、無効である" do
      @article = FactoryBot.build(:article, images: nil)
      @article.valid?
      expect(@article.errors[:images]).to include("を入力してください")
    end
    it "bread_nameがない場合、無効である" do
      @article = FactoryBot.build(:article, bread_name: nil)
      @article.valid?
      expect(@article.errors[:bread_name]).to include("を入力してください")
    end
    it "reviewがない場合、無効である" do
      @article = FactoryBot.build(:article, review: nil)
      @article.valid?
      expect(@article.errors[:review]).to include("を入力してください")
    end
    it "rateがない場合、無効である" do
      @article = FactoryBot.build(:article, rate: nil)
      @article.valid?
      expect(@article.errors[:rate]).to include("を入力してください")
    end
  end
end