FactoryBot.define do
	factory :theater do
		name { '本田劇場' }
		user
	end
	factory :theater2, class: Theater do
		name { 'PARCO劇場' }
		user2
	end
end