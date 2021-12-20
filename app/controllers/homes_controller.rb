class HomesController < ApplicationController

  def top
    @articles = Article.order("id DESC").page(params[:page]).per(3)
    @week_ranks = Article.find(Good.group(:article_id).where(created_at: Time.current.all_week).limit(5).order('count(article_id) desc').pluck(:article_id))
    #Good.group(:article_id)=Goodモデルのarticle_idが同じものをまとめる
    #Time.current=現在の日時を表示するメソッド
    #.all_week=1週間のデータを取得
    #order('count(article_id) desc')=まとめたものをarticle_idの多い順に並び替える
    #pluck(:article_id)=article_idで値を取りだす
  end

end
