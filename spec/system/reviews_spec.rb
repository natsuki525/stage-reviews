require 'rails_helper'
RSpec.describe 'レビューのテスト' do
	# include ControllerMacros
	# include Devise::Test::ControllerHelpers
	# include Warden::Test::Helpers
	let(:user) { create(:user) }
	let(:user2) { create(:user) }
	let(:review) { create(:review, user: user)}
	let(:review2) { create(:review, user: user2)}
	before do
		# Warden.test_mode!
		# login_as(user, :scope => :user)
		#login_user
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button 'Log in'
	end
	describe '投稿のテスト' do
		context '表示のテスト' do
			before do
				visit new_review_path
			end
			it 'レビューすると表示される' do
				expect(page).to have_content('レビューする')
			end
		end
		context '投稿する' do
			before do
				visit new_review_path
			end
			it '投稿に成功する' do
				fill_in 'review[title]', with: 'テスト投稿'
				fill_in 'review[stage_date]', with: '2020/3/20 13:00'
				fill_in 'review[theater_name]', with: 'テスト劇場'
				fill_in 'review[seat]', with: '1階D5'
				select '★★', from: 'review[view_level]'
 				select '★★', from: 'review[satisfaction_level]'
 				select '★★', from: 'review[story_level]'
 				select '★★', from: 'review[stage_set_level]'
 				select '★★', from: 'review[costume_level]'
				fill_in 'review[body]', with: '悲しかった'
				click_button '投稿'
				expect(current_path).to eq(root_path)
			end
		end
	end
	describe '編集のテスト' do
		context '自分の投稿の編集画面への遷移' do
			it '遷移できる' do
				visit edit_review_path(review)
				expect(current_path).to eq('/reviews/' + review.id.to_s + '/edit')
			end
		end
		context '他人の投稿の編集画面への遷移' do
			it '遷移できない' do
				visit edit_review_path(review2)
				expect(current_path).to eq('/reviews/' + review2.id.to_s)
			end
		end
		context '表示の確認' do
			before do
				visit edit_review_path(review)
			end
			it 'レビュー編集と表示される' do
				expect(page).to have_content('レビュー編集')
			end
			it '画像編集フォームが表示される' do
				expect(page).to have_field 'review[image]'
			end
			it '作品名編集フォームが表示される' do
				expect(page).to have_field 'review[title]'
			end
			it '劇団名編集フォームが表示される' do
				expect(page).to have_field 'review[troupe_name]'
			end
			it '観劇日編集フォームが表示される' do
				expect(page).to have_field 'review[stage_date]'
			end
			it '劇場名編集フォームが表示される' do
				expect(page).to have_field 'review[theater_name]'
			end
			it '座席編集フォームが表示される' do
				expect(page).to have_field 'review[seat]'
			end
			it '座席の見え方編集フォームが表示される' do
				expect(page).to have_field 'review[view_level]'
			end
			it '評価と表示される' do
				expect(page).to have_content('評価')
			end
			it '満足度編集フォームが表示される' do
				expect(page).to have_field 'review[satisfaction_level]'
			end
			it 'ストーリー性編集フォームが表示される' do
				expect(page).to have_field 'review[story_level]'
			end
			it '舞台セット編集フォームが表示される' do
				expect(page).to have_field 'review[stage_set_level]'
			end
			it '衣装編集フォームが表示される' do
				expect(page).to have_field 'review[costume_level]'
			end
			it '感想編集フォームが表示される' do
				expect(page).to have_field 'review[body]'
			end
		end
	end
end
