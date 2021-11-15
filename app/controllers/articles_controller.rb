class ArticlesController < ApplicationController

  def index
    @articles = Article.order("id DESC").page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
    if @article.user == current_user
      render "edit"
    else
      redirect_to articles_path
    end
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    redirect_to article_path(article.id)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :shop_id, :prefecture_code, :bread_name, :review, :rate, { images: [] } )
  end

end
