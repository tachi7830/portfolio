class ShopsController < ApplicationController
  def index
    @shops = Shop.page(params[:page]).per(10)
  end

  def show
    @shop = Shop.find(params[:id])
  end
  
end
