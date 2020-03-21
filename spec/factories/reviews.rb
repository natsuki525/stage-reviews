FactoryBot.define do
	factory :review do
		title {'テスト投稿'}
		body {'テストテストテストテストテスト'}
		stage_date {'2020/2/20 13:00'}
		seat {'1階A1'}
		view_level {'★'}
		satisfaction_level {'★'}
		story_level {'★'}
		stage_set_level {'★'}
		costume_level {'★'}
		theater_name {'本田劇場'}
		user
	end
end