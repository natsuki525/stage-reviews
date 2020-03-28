FactoryBot.define do
	factory :user, class: User do
		last_name { '山田' }
		first_name { '太郎' }
		last_name_kana { 'ヤマダ' }
		first_name_kana { 'タロウ' }
		nickname {'tarou1'}
		email { Faker::Internet.email }
		password {'test1234'}
		password_confirmation {'test1234'}
	end
	factory :user2, class: User do
		last_name { '高橋' }
		first_name { '愛' }
		last_name_kana { 'タカハシ' }
		first_name_kana { 'アイ' }
		nickname {'ai2'}
		email { Faker::Internet.email }
		password {'password'}
		password_confirmation {'password'}
	end
end