FactoryBot.define do
  factory :shop do
    name {"ベーカリー山田"}
    description {"よろしくお願いします"}
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') }
    news {"新商品が出ました"}
    url {"pan.com"}
    address {"北海道札幌市北区屯田４条１０丁目１"}
    phone_number {"11111111111"}
    opening_hour {"AM8:00~PM18:00"}
    closed_day {"火曜日"}
  end
end