FactoryBot.define do
  factory :task do
    name { Faker::Name.name }
    is_done { false }

    trait :with_is_done_true do
      is_done { true }
    end
  end
end
