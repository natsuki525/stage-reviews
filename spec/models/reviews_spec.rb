require 'rails_helper'

RSpec.describe 'Reviewモデルのテスト', type: :model do

	describe 'バリデーションのテスト' do
		let(:user) { create(:user) }
    	let!(:review) { build(:review, user_id: user.id) }

    	context 'titleカラム' do
    		it '空欄でないこと' do
    			review.title = ''
        		expect(review.valid?).to eq false;
    		end
    		it '50文字以下であること' do
    			review.title = Faker::Lorem.characters(number:51)
        		expect(review.valid?).to eq false;
    		end
    	end
    	context 'bodyカラム' do
    		it '空欄でないこと' do
    			review.body = ''
    			expect(review.valid?).to eq false;
    		end
    		it '300文字以下であること' do
    			review.body = Faker::Lorem.characters(number:301)
        		expect(review.valid?).to eq false;
    		end
    	end
    	context 'stage_dateカラム' do
    		it '空欄でないこと' do
    			review.stage_date = ''
    			expect(review.valid?).to eq false;
    		end
    	end
    	context 'theater_nameカラム' do
    		it '空欄でないこと' do
    			review.theater_name = ''
    			expect(review.valid?).to eq false;
    		end
    	end
	end

	describe 'アソシエーションのテスト' do
		context 'Userモデルとの関係' do
      		it 'N:1となっている' do
        		expect(Review.reflect_on_association(:user).macro).to eq :belongs_to
     		end
    	end
	end

end