require 'rails_helper'

RSpec.describe FavouritesController, type: :controller do

  describe "お店を「お気に入り」できるか" do
    before do
      @user = FactoryBot.create(:user, :a)
      @shop = FactoryBot.create(:shop)
    end
    it "create favourite" do
      sign_in @user
      expect {
        post :create, params: {
          shop_id: @shop.id,
          favourite_id: 1
        }
      }.to change(Favourite, :count).by(1)
    end
  end
  describe "お店の「お気に入り」を削除できるか" do
    before do
      @user = FactoryBot.create(:user, :a)
      @shop = FactoryBot.create(:shop)
    end
    it "destroy favourite" do
      sign_in @user
      Favourite.create!(user: @user, shop: @shop)
      expect {
        delete :destroy, params: {
          shop_id: @shop.id,
          favourite_id: 1
        }
      }.to change(Favourite, :count).by(-1)
    end
  end
end