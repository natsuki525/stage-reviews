FactoryBot.define do
	factory :user do
		first_name {'山田'}
		last_name {'太郎'}
		first_name_kana {'ヤマダ'}
		last_name_kana {'タロウ'}
		nickname {'tarou1'}
		email {'test@test'}
		password {'test1234'}
	end
end