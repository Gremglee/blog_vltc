FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    author { association :user }

    factory :post_with_comments do
      comments { [association(:comment, user: author)] }
    end
  end
end
