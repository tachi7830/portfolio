class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @articles = Article.order("id DESC").page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      flash[:notice] = "投稿しました！"
      redirect_to article_path(@article)
    else
      render "new"
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
    unless @article 
      redirect_to articles_path
    end
    @comment = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    flash[:notice] = "記事更新しました！"
    redirect_to article_path(article.id)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    flash[:notice] = "記事削除しました！"
    redirect_to user_path(current_user.id)
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :shop_id, :prefecture_code, :bread_name, :review, :rate, { images: [] } )
  end

  def ensure_correct_user
    @article = Article.find(params[:id])
    unless @article.user == current_user
      redirect_to articles_path
    end
  end
  
  def browser_back

  end 
end
