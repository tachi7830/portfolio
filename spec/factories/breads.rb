FactoryBot.define do
  factory :bread do
    shop_id {1}
    name {"メロンパン"}
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') }
    price {"300"}
  end
end