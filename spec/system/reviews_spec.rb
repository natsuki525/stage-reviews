require 'rails_helper'

describe '投稿のテスト' do
	let(:user) { create(:user) }
	let!(:user2) { create(:user) }
	let!(:review) { create(:review, user: user)}
	let!(:review2) { create(:review, user: user2)}
	before do
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button 'Log in'
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
				expect(current_path).to eq('/reviews')
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
				expect(page).to have_field 'review[image]' with review.image
			end
			it '作品名編集フォームが表示される' do
				expect(page).to have_field 'review[title]' with review.title
			end
			it '劇団名編集フォームが表示される' do
				expect(page).to have_field 'review[troupe_name]'
			end
			it '観劇日編集フォームが表示される' do
				expect(page).to have_field 'review[stage_date]' with review.stage_date
			end
			it '劇場名編集フォームが表示される' do
				expect(page).to have_field 'review[theater_name]' with review.theater_name
			end
			it '座席編集フォームが表示される' do
				expect(page).to have_field 'review[seat]' with review.seat
			end
			it '座席の見え方編集フォームが表示される' do
				expect(page).to have_field 'review[seat]' with review.seat
			end
			it '評価と表示される' do
				expect(page).to have_content('評価')
			end
			it '満足度編集フォームが表示される' do
				expect(page).to have_field 'review[satisfaction_level]' with review.satisfaction_level
			end
			it 'ストーリー性編集フォームが表示される' do
				expect(page).to have_field 'review[story_level]' with review.story_level
			end
			it '舞台セット編集フォームが表示される' do
				expect(page).to have_field 'review[stage_set_level]' with review.stage_set_level
			end
			it '衣装編集フォームが表示される' do
				expect(page).to have_field 'review[costume_level]' with review.costume_level
			end
			it '感想編集フォームが表示される' do
				expect(page).to have_field 'review[body]' with review.body
			end
		end
	end
end