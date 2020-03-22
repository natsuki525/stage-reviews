FactoryBot.define do
	factory :user do
		last_name { '山田' }
		first_name { '太郎' }
		last_name_kana { 'ヤマダ' }
		first_name_kana { 'タロウ' }
		nickname {'tarou1'}
		email { |n| "y#{n}@y"}
		password {'test1234'}
	end
	factory :user2 do
		last_name { '高橋' }
		first_name { '愛' }
		last_name_kana { 'タカハシ' }
		first_name_kana { 'アイ' }
		nickname {'ai2'}
		email { |n| "t#{n}@t"}
		password {'password'}
	end
end