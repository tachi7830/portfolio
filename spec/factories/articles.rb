FactoryBot.define do
  factory :article do
    user_id {1}
    shop_id {1}
    prefecture_code {"1"}
    images {[ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') ]}
    bread_name {"食パン"}
    review {"おいしい"}
    rate {5.0}
  end
end