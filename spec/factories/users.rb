FactoryBot.define do

  factory :user do
    trait :a do
      id {1}
      name { "test_user"}
      email { "test_mail@gmail.com" }
      password { "111111" }
      password_confirmation { "111111" }
      confirmed_at { Time.now }
    end
    trait :b do
      id {2}
      name { "test2_user"}
      email { "test2_mail@gmail.com" }
      password { "222222" }
      password_confirmation { "222222" }
      confirmed_at { Time.now }
    end
  end

end