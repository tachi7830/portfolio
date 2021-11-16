class HomesController < ApplicationController

  def top
    @articles = Article.order("id DESC").page(params[:page]).per(3)
    @week_ranks = Article.find(Good.group(:article_id).where(created_at: Time.current.all_week).limit(5).order('count(article_id) desc').pluck(:article_id))
  end

end
