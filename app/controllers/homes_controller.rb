class HomesController < ApplicationController
  def top
    @articles = Article.order("id DESC").page(params[:page]).per(3)
  end
end
