require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do

	describe 'バリデーションのテスト' do
		let(:user) { build(:user) }
		subject { test_user.valid? }

		context '空欄でないこと' do
			let(:test_user) { user }
			it 'emailカラム' do
				test_user.email = ''
				is_expected.to eq false;
			end
			it 'last_nameカラム' do
				test_user.last_name = ''
				is_expected.to eq false;
			end
			it 'first_nameカラム' do
				test_user.first_name = ''
				is_expected.to eq false;
			end
			it 'last_name_kanaカラム' do
				test_user.last_name_kana = ''
				is_expected.to eq false;
			end
			it 'first_name_kanaカラム' do
				test_user.first_name_kana = ''
				is_expected.to eq false;
			end
			it 'nicknameカラム' do
				test_user.nickname = ''
				is_expected.to eq false;
			end
		end
	end

	describe 'アソシエーションのテスト' do
		context 'Reviewモデルとの関係' do
			it '1:Nとなっている' do
				expect(User.reflect_on_association(:reviews).macro).to eq :has_many
			end
		end
	end

end