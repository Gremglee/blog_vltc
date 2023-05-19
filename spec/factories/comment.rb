FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
    user { association :user }
    post { association :post }
  end
end
