FactoryBot.define do
	factory :review do
		title {'テスト投稿'}
		body {'テストテストテストテストテスト'}
		stage_date {'2020/2/20 13:00'}
		seat {'1階A1'}
		view_level {'1'}
		satisfaction_level {'1'}
		story_level {'1'}
		stage_set_level {'1'}
		costume_level {'1'}
		theater_name {'本田劇場'}
		user
	end
end