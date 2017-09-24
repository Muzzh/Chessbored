FactoryGirl.define do
  factory :user do
    id 1
    email "test@test.user"
    password "I am a password."
  end

  factory :rook do
    type      'Rook'
    user_id   1
    game_id   1
    x         0
    y         0
    captured  false
    color     'white'
  end

  factory :knight do
    type      'Knight'
    user_id   1
    game_id   1
    x         1
    y         0
    captured  false
    color     'white'
  end

  factory :bishop do
    type      'Bishop'
    user_id   1
    game_id   1
    x         2
    y         0
    captured  false
    color     'white'
  end

  factory :king do
    type      'King'
    user_id   1
    game_id   1
    x         3
    y         0
    captured  false
    color     'white'
  end

  factory :queen do
    type      'Queen'
    user_id   1
    game_id   1
    x         4
    y         0
    captured  false
    color     'white'
  end

  factory :pawn do
    type      'Pawn'
    user_id   1
    game_id   1
    x         0
    y         1
    captured  false
    color     'white'
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
end
