require 'rails_helper'

RSpec.describe BreadsController, type: :controller do

  before do
    @user = FactoryBot.create(:user, :a)
    @shop = FactoryBot.create(:shop)
  end
  describe "パン一覧ページにアクセスできるか" do
    context "login user" do
      it "responds successfully" do
        sign_in @user
        get :index, params: {shop_id: @shop.id }
        #レスポンスが返ってくることを期待する
        expect(response).to be_success
      end
      # 200(リクエスト成功)レスポンスが返ってきているか？
      it "returns a 200 response" do
        sign_in @user
        get :index, params: {shop_id: @shop.id}
        expect(response).to have_http_status "200"
      end
    end
    context "not login user" do
      it "responds successfully" do
        get :index, params: {shop_id: @shop.id}
        #レスポンスが返ってくることを期待する
        expect(response).to be_success
      end
      # 200(リクエスト成功)レスポンスが返ってきているか？
      it "returns a 200 response" do
        get :index, params: {shop_id: @shop.id}
        expect(response).to have_http_status "200"
      end
    end
  end
end