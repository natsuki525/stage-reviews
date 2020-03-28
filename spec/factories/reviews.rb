FactoryBot.define do
	factory :review do
		title { Faker::Lorem.characters(number:5) }
		body { Faker::Lorem.characters(number:20) }
		stage_date {'2020/2/20 13:00'}
		seat {'1階A1'}
		view_level {'1'}
		satisfaction_level {'2'}
		story_level {'3'}
		stage_set_level {'4'}
		costume_level {'5'}
		theater_name {'本田劇場'}
		image {''}
		user
	end
	factory :review2, class: Review do
		title { Faker::Lorem.characters(number:5) }
		body { Faker::Lorem.characters(number:20) }
		stage_date {'2020/2/21 13:00'}
		seat {'1階B1'}
		view_level {'2'}
		satisfaction_level {'3'}
		story_level {'4'}
		stage_set_level {'5'}
		costume_level {'1'}
		theater_name {'PARCO劇場'}
		image {''}
		user2
	end
	factory :review3, class: Review do
		title { Faker::Lorem.characters(number:5) }
		body { Faker::Lorem.characters(number:20) }
		stage_date {'2020/2/22 13:00'}
		seat {'1階C1'}
		view_level {'3'}
		satisfaction_level {'4'}
		story_level {'5'}
		stage_set_level {'1'}
		costume_level {'2'}
		image {''}
		user
	end
end