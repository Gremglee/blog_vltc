FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    role { Role.find(3) } # 3 (writer) is the default role_id for users
    password { Faker::Internet.password }

    trait :admin do
      role { Role.find(1) } # 1 (admin) is the role_id for admins
    end
  end
end
