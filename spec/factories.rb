FactoryGirl.define do
  factory :king do
    type      'King'
    user_id   1
    game_id   1
    x         1
    y         2
    captured  false
  end

  factory :game do
    trait :pending do
      status 'pending'
    end

    trait :completed do
      status 'completed'
    end

    trait :in_progress do
      status 'in_progress'
    end
  end

  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password "smartPassword"
    password_confirmation "smartPassword"
  end
end
