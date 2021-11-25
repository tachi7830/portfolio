require 'rails_helper'

RSpec.describe HomesController, type: :controller do

  describe "TOPページにアクセスできるか" do
    before do
      @user = FactoryBot.create(:user, :a)
    end
    context "login user" do
      it "responds successfully" do
        sign_in @user
        get :top
        expect(response).to be_success
      end
      it "returns a 200 response" do
        sign_in @user
        get :top
        expect(response).to have_http_status "200"
      end
    end
    context "not login user" do
      it "responds successfully" do
        get :top
        expect(response).to be_success
      end
      it "returns a 200 response" do
        get :top
        expect(response).to have_http_status "200"
      end
    end
  end
end