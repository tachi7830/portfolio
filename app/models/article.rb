class Article < ApplicationRecord
  belongs_to :user
  belongs_to :shop, optional: true
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy

  include JpPrefecture
  jp_prefecture :prefecture_code

  THUMBNAIL_SIZE = [220, 150]
  mount_uploaders :images, ImageUploader

  def gooded_by?(user)
    goods.where(user: user).exists?
  end
  
  def self.create_week_ranks
    Article.find(Good.group(:article_id).where(created_at: Time.current.all_week).limit(5).order('count(article_id) desc').pluck(:article_id))
  end
  #Good.group(:article_id)=Goodモデルのarticle_idが同じものをまとめる
  #Time.current=現在の日時を表示するメソッド
  #.all_week=1週間のデータを取得
  #order('count(article_id) desc')=まとめたものをarticle_idの多い順に並び替える
  #pluck(:article_id)=article_idで値を取りだす
  
  validates :shop_id, presence: true
  validates :images, presence: true
  validates :prefecture_code, presence: true
  validates :bread_name, presence: true, length: { maximum: 30 }
  validates :review, presence: true, length: { maximum: 200 }
  validates :rate, presence: true

end
