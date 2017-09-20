FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@test.user"
    end
    password 'mypassword'
    password_confirmation 'mypassword'
  end

  factory :rook do
    type      'Rook'
    user_id   1
    game_id   1
    x         0
    y         0
    captured  false
  end

  factory :knight do
    type      'Knight'
    user_id   1
    game_id   1
    x         1
    y         0
    captured  false
  end

  factory :bishop do
    type      'Bishop'
    user_id   1
    game_id   1
    x         2
    y         0
    captured  false
  end

  factory :king do
    game
    type      'King'
    user_id   1
    game_id   1
    x         3
    y         0
    captured  false
  end

  factory :queen do
    type      'Queen'
    user_id   1
    game_id   1
    x         4
    y         0
    captured  false
  end

  factory :pawn do
    type      'Pawn'
    user_id   1
    game_id   1
    x         0
    y         1
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
