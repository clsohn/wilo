FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name 'Lynn'
    last_name 'Simpson'
    password 'password123'
    password_confirmation 'password123'
  end
end
