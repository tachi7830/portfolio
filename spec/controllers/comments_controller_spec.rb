require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "記事にコメントを投稿できるか" do
    before do
      @user = FactoryBot.create(:user, :a)
      @article = FactoryBot.create(:article)
    end
    it "create comment" do
      sign_in @user
      expect {
        post :create, params: {
          article_id: @article.id,
          comment: {
            comment: "おいしそうですね！",
          }
        }
      }.to change(Comment, :count).by(1)
    end
  end
  describe "記事のコメントを削除できるか" do
    before do
      @user = FactoryBot.create(:user, :a)
      @article = FactoryBot.create(:article)
    end
    it "destroy comment" do
      sign_in @user
      Comment.create!(user: @user, article: @article, comment: "おいしそうです")
      expect {
        delete :destroy, params: {
          article_id: @article.id,
          id: 1
        }
      }.to change(Comment, :count).by(-1)
    end
  end
end