class GoodsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @article = Article.find(params[:article_id])
    good = current_user.goods.new(article_id: @article.id)
    good.save
  end

  def destroy
    @article = Article.find(params[:article_id])
    good = current_user.goods.find_by(article_id: @article.id)
    good.destroy
  end

end
