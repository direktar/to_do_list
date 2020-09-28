FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "My project #{n}" }
    user { association :user }
  end
end
