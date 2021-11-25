require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "ユーザー詳細ページにアクセスできるか" do
    before do
      @user = FactoryBot.create(:user, :a)
    end
    context "login user" do
      it "responds successfully" do
        sign_in @user
        get :show, params: {id: @user.id}
        expect(response).to be_success
      end
      it "returns a 200 response" do
        sign_in @user
        get :show, params: {id: @user.id}
        expect(response).to have_http_status "200"
      end
    end
    context "not login user" do
      it "responds successfully" do
        get :show, params: {id: @user.id}
        expect(response).to be_success
      end
      it "returns a 200 response" do
        get :show, params: {id: @user.id}
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "ユーザー編集ページにアクセスできるか" do
    before do
      @user = FactoryBot.create(:user, :a)
      @other_user = FactoryBot.create(:user, :b)
    end
    context "login user" do
      it "responds successfully" do
        sign_in @user
        get :edit, params: {id: @user.id}
        expect(response).to be_success
      end
      it "returns a 200 response" do
        sign_in @user
        get :edit, params: {id: @user.id}
        expect(response).to have_http_status "200"
      end
    end
    context "not login user" do
      it "responds successfully" do
        get :edit, params: {id: @user.id}
        expect(response).to_not be_success
      end
      it "returns a 302 response" do
        get :edit, params: {id: @user.id}
        expect(response).to have_http_status "302"
      end
      it "redirects user_session_path" do
        get :edit, params: {id: @user.id}
        expect(response).to redirect_to user_session_path
      end
    end
    context "other user" do
      #ログインユーザーとは別のユーザーの場合
      it "redirects user_path(@user)" do
      #マイページにリダイレクトすること
        sign_in @other_user
        get :edit, params: {id: @user.id}
        expect(response).to redirect_to user_path(@other_user)
      end
    end
  end

  describe "ユーザー情報を更新できるか" do
    before do
      @user = FactoryBot.create(:user, :a)
      @other_user = FactoryBot.create(:user, :b)
    end
    # ユーザー情報を更新できること
    it "update user" do
      sign_in @user
      user_params = {name: "updateuser"}
      patch :update, params: {id: @user.id, user: user_params }
      expect(@user.reload.name).to eq "updateuser"
    end
    # ユーザー情報を更新するとマイページに遷移する
    it "redirects user_path(@user)" do
      sign_in @user
      user_params = {name: "updateuser"}
      patch :update, params: {id: @user.id, user: user_params}
      expect(response).to redirect_to user_path(@user)
    end
  end
end