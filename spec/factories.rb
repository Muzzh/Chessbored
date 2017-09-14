FactoryGirl.define do

	factory :king do
		type  		"King"
		user_id	  1
		game_id		1
		x					1
		y					2
		captured 	false
	end

  factory :game do

    trait :pending do
      status 'pending'
    end
  end

end
