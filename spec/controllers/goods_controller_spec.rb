require 'rails_helper'

RSpec.describe GoodsController, type: :controller do

  describe "記事に「いいね」できるか" do
    before do
      @user = FactoryBot.create(:user, :a)
      @article = FactoryBot.create(:article)
    end
    it "create good" do
      sign_in @user
      expect {
        post :create, params: {
          article_id: @article.id,
          good_id: 1
        }
      }.to change(Good, :count).by(1)
    end
  end
  describe "記事の「いいね」を削除できるか" do
    before do
      @user = FactoryBot.create(:user, :a)
      @article = FactoryBot.create(:article)
    end
    it "destroy good" do
      sign_in @user
      Good.create!(user: @user, article: @article)
      expect {
        delete :destroy, params: {
          article_id: @article.id
        }
      }.to change(Good, :count).by(-1)
    end
  end
end