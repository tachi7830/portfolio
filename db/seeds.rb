# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
) if Rails.env.development?

#メール認証スキップユーザー
5.times do |n|
  User.create!(
    name: "ユーザー#{n + 1}",
    email: "user#{n + 1}@gmail.com",
    password:  "11111#{n + 1}",
    confirmed_at: Time.now
  )
end

Shop.create!([
  {name: "ベーカリー山田",
  description: "よろしくお願いします1",
  image: File.open("./app/assets/images/shop/shop1.jpg"),
  news: "新商品が出ました1",
  url: "pan1.com",
  address: "北海道札幌市北区屯田４条１０丁目１",
  phone_number: "11111111111",
  opening_hour: "AM7:00~PM18:00",
  closed_day: "月曜日"},

  {name: "ベーカリー田中",
  description: "よろしくお願いします2",
  image: File.open("./app/assets/images/shop/shop2.jpg"),
  news: "新商品が出ました2",
  url: "pan2.com",
  address: "北海道河西郡芽室町西２条南７丁目",
  phone_number: "11111111112",
  opening_hour: "AM8:00~PM18:00",
  closed_day: "火曜日"},

  {name: "ベーカリー佐藤",
  description: "よろしくお願いします3",
  image: File.open("./app/assets/images/shop/shop3.jpg"),
  news: "新商品が出ました3",
  url: "pan3.com",
  address: "青森県青森市大矢沢野田８７番４号",
  phone_number: "11111111113",
  opening_hour: "AM9:00~PM18:00",
  closed_day: "水曜日"},

  {name: "ベーカリー村田",
  description: "よろしくお願いします4",
  image: File.open("./app/assets/images/shop/shop4.jpg"),
  news: "新商品が出ました4",
  url: "pan4.com",
  address: "岩手県盛岡市新庄下八木田６０−１８",
  phone_number: "111111111114",
  opening_hour: "AM10:00~PM18:00",
  closed_day: "木曜日"},

  {name: "ベーカリー遠藤",
  description: "よろしくお願いします5",
  image: File.open("./app/assets/images/shop/shop5.jpg"),
  news: "新商品が出ました5",
  url: "pan5.com",
  address: "宮城県加美郡加美町宮崎町１３４",
  phone_number: "11111111115",
  opening_hour: "AM11:00~PM18:00",
  closed_day: "金曜日"},
])

5.times do |n|
  Shop.all.each do |shop|
    shop.breads.create!(
      shop_id: "1",
      name: "パン#{n + 1}",
      image: File.open("./app/assets/images/bread/bread#{n + 1}.jpg"),
      price: "3#{n + 1}0"
    )
  end
end

5.times do |n|
  User.all.each do |user|
    user.articles.create!(
      user_id: "1",
      shop_id: "#{n + 1}",
      prefecture_code: "#{n + 1}",
      images: [File.open("./app/assets/images/bread/bread#{n + 1}.jpg")],
      #carrierwaveでmount_uploaders（複数画像設定）のため画像を配列で受け取る
      bread_name: "～パン、～パン",
      review: "すごくおいしかったです#{n + 1}",
      rate: "#{n + 1}"
    )
  end
end