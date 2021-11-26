require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'コメント投稿のテスト' do
    it "user_id,shop_id,commentがあれば登録できる" do
      @user = FactoryBot.create(:user, :a)
      @article = FactoryBot.create(:article)
      @comment = FactoryBot.build(:comment)
      expect(@comment).to be_valid
    end
  end

  describe 'バリデーションのテスト' do
    it "commentが空欄の場合登録できない" do
      @comment = FactoryBot.build(:comment, comment: nil)
      @comment.valid?
      expect(@comment.errors[:comment]).to include("を入力してください")
    end
    it 'commentが100文字以下の場合登録できる' do
      @user = FactoryBot.create(:user, :a)
      @article = FactoryBot.create(:article)
      @comment = FactoryBot.build(:comment, comment: "a"*100)
      expect(@comment).to be_valid
    end
    it 'commentが101文字以上の場合登録できない' do
      @comment = FactoryBot.build(:comment, comment: "a"*101)
      @comment.valid?
      expect(@comment.errors[:comment]).to include("は100文字以内で入力してください")
    end
  end
end