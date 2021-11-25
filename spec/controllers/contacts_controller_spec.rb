require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  describe "お問合せページにアクセスできるか" do
    before do
      @user = FactoryBot.create(:user, :a)
    end
    context "login user" do
      it "responds successfully" do
        sign_in @user
        get :new
        expect(response).to be_success
      end
      it "returns a 200 response" do
        sign_in @user
        get :new
        expect(response).to have_http_status "200"
      end
    end
    context "not login user" do
      it "responds successfully" do
        get :new
        expect(response).to be_success
      end
      it "returns a 200 response" do
        get :new
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "お問合せを送信できるか" do
    before do
      @user = FactoryBot.create(:user, :a)
    end
    context "login user" do
      it "create contact" do
        sign_in @user
        expect {
          post :create, params: {
            contact: {
              name: "test_user",
              email: "test_mail@gmail.com",
              message: "探しているお店がありません",
            }
          }
        }.to change(Contact, :count).by(1)
      end
      # お問合せ送信後、お問合せ完了ページへリダイレクトされているか？
      it "redirects contacts_thanks_path" do
        sign_in @user
        expect {
          post :create, params: {
            contact: {
              name: "test_user",
              email: "test_mail@gmail.com",
              message: "探しているお店がありません",
            }
          }
        }.to change(Contact, :count).by(1)
        expect(response).to redirect_to contacts_thanks_path
      end
    end
    context "not login user" do
      it "create contact" do
        expect {
          post :create, params: {
            contact: {
              name: "test_user",
              email: "test_mail@gmail.com",
              message: "探しているお店がありません",
            }
          }
        }.to change(Contact, :count).by(1)
      end
      # お問合せ送信後、お問合せ完了ページへリダイレクトされているか？
      it "redirects contacts_thanks_path" do
        expect {
          post :create, params: {
            contact: {
              name: "test_user",
              email: "test_mail@gmail.com",
              message: "探しているお店がありません",
            }
          }
        }.to change(Contact, :count).by(1)
        expect(response).to redirect_to contacts_thanks_path
      end
    end
  end
end