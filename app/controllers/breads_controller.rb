class BreadsController < ApplicationController

  def index
    @shop = Shop.find(params[:shop_id])
    @breads = @shop.breads.all.order("id DESC")
  end

end
