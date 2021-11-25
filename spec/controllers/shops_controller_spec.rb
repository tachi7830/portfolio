require 'rails_helper'

RSpec.describe ShopsController, type: :controller do
  
  describe "お店一覧ページにアクセスできるか" do
    before do
      @shop = FactoryBot.create(:shop)
      @user = FactoryBot.create(:user, :a)
    end
    context "login user" do
      it "responds successfully" do
        sign_in @user
        get :index
        #レスポンスが返ってくることを期待する
        expect(response).to be_success
      end
      # 200(リクエスト成功)レスポンスが返ってきているか？
      it "returns a 200 response" do
        sign_in @user
        get :index
        expect(response).to have_http_status "200"
      end
    end
    context "not login user" do
      it "responds successfully" do
        get :index
        #レスポンスが返ってくることを期待する
        expect(response).to be_success
      end
      # 200(リクエスト成功)レスポンスが返ってきているか？
      it "returns a 200 response" do
        get :index
        expect(response).to have_http_status "200"
      end
    end
  end
  describe "お店詳細ページにアクセスできるか" do
    before do
      @shop = FactoryBot.create(:shop)
      @user = FactoryBot.create(:user, :a)
    end
    context "login user" do
      it "responds successfully" do
        sign_in @user
        get :show, params: {id: @shop.id}
        #レスポンスが返ってくることを期待する
        expect(response).to be_success
      end
      # 200(リクエスト成功)レスポンスが返ってきているか？
      it "returns a 200 response" do
        sign_in @user
        get :show, params: {id: @shop.id}
        expect(response).to have_http_status "200"
      end
    end
    context "not login user" do
      it "responds successfully" do
        get :show, params: {id: @shop.id}
        #レスポンスが返ってくることを期待する
        expect(response).to be_success
      end
      # 200(リクエスト成功)レスポンスが返ってきているか？
      it "returns a 200 response" do
        get :show, params: {id: @shop.id}
        expect(response).to have_http_status "200"
      end
    end
  end
end