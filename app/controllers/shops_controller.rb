class ShopsController < ApplicationController
  def index
    @shops = Shop.page(params[:page]).per(10)
  end

  def show
    @shop = Shop.find(params[:id])
    @articles = @shop.article.order("id DESC").page(params[:page]).per(5)
    @breads = @shop.breads.all.order("id DESC").limit(8)
  end

  def bread_all
    @shop = Shop.find(params[:shop_id])
  end
  
  def search

    @searchs = Shop.search(params[:search])
    
#@teamsは好きなものを入力して、Adminの部分には検索したいテーブル名を入力する
  end

  def shop_params
    params.require(:shop).permit(:shop_id, :name, :price, :bread_name, :image)
  end

end