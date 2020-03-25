require 'rails_helper'

describe User::ReviewsController, type: :system do
	let(:user) { create(:user) }
	let(:review) { create(:review, user: user) }

	describe '#new' do
		context 'ログインしていない場合' do
			before do
				visit new_review_path
			end
			it 'ログインページにリダイレクトされる' do
				expect(current_path).to eq(new_user_session_path)
			end
		end
		context 'ログインしている場合' do
			before do
				visit new_user_session_path
				fill_in 'user[email]', with: user.email
				fill_in 'user[password]', with: user.password
				click_button 'Log in'
			end
 			it '新規投稿画面表示される' do
 				visit new_review_path
 				expect(page).to have_content('レビューする')
 			end
		end
	end

	describe '#create' do
		before do
			visit new_user_session_path
			fill_in 'user[email]', with: user.email
			fill_in 'user[password]', with: user.password
			click_button 'Log in'
		end
		context '「行ったことのある劇場から選択」で投稿' do
			before do
				visit new_review_path
			end
			it '投稿が成功する' do
				visit '/reviews/new'
				fill_in 'review[title]', with: 'テスト投稿1'
 				fill_in 'review[stage_date]', with: '2020/3/20 13:00'
 				choose 'selected_btn_been_theater'
 				select '', from: 'review[theater]'
 				fill_in 'review[seat]', with: '1階D5'
 				select '★★', from: 'review[view_level]'
 				select '★★', from: 'review[satisfaction_level]'
 				select '★★', from: 'review[story_level]'
 				select '★★', from: 'review[stage_set_level]'
 				select '★★', from: 'review[costume_level]'
 		  		fill_in 'review[body]', with: '面白かった'
 		  		click_button '投稿'
 		  		expect(root_path).to redirect_to root_path
			end
		end
		context '「新しい劇場を追加」で投稿' do
			before do
				visit new_review_path
			end
			it '投稿が成功する' do
				visit '/reviews/new'
				fill_in 'review[title]', with: 'テスト投稿2'
 				fill_in 'review[stage_date]', with: '2020/3/20 19:00'
 				choose 'selected_btn_new_theater'
 				fill_in 'review[theater_name]', with: 'テスト劇場'
 				fill_in 'review[seat]', with: '2階F5'
 				select '★', from: 'review[view_level]'
 				select '★', from: 'review[satisfaction_level]'
 				select '★', from: 'review[story_level]'
 				select '★', from: 'review[stage_set_level]'
 				select '★', from: 'review[costume_level]'
 		  		fill_in 'review[body]', with: 'つまらなかった'
 		  		click_button '投稿'
			end
		end
	end
end