class FavouritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @shop = Shop.find(params[:shop_id])
    favourite = @shop.favourites.new(user_id: current_user.id)
    favourite.save
  end
  
  def destroy
    @shop = Shop.find(params[:shop_id])
    favourite = @shop.favourites.find_by(user_id: current_user.id)
    favourite.destroy
  end
  
  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end
  
end
