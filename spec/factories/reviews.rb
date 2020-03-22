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
		user
	end
	# factory :review2 do
	# 	title { Faker::Lorem.characters(number:5) }
	# 	body { Faker::Lorem.characters(number:20) }
	# 	stage_date {'2020/2/21 13:00'}
	# 	seat {'1階B1'}
	# 	view_level {'★★'}
	# 	satisfaction_level {'★★'}
	# 	story_level {'★★'}
	# 	stage_set_level {'★★'}
	# 	costume_level {'★★'}
	# 	theater_name {'PARCO劇場'}
	# 	user2
	# end
end