FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    password { '12345678' }
    password_confirmation { '12345678' }
  end

  factory :project do
    name { "Complete the test task for ruby Garage" }
    user
  end
end
