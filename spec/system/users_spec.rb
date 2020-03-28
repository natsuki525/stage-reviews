require 'rails_helper'

describe 'ユーザー認証のテスト' do
	describe 'ユーザー新規登録' do
		before do
			visit new_user_registration_path
		end
		context '新規登録画面に遷移' do
			it '新規登録に成功する' do
				fill_in 'user[last_name]', with: '青山'
				fill_in 'user[first_name]', with: '花子'
				fill_in 'user[last_name_kana]', with: 'アオヤマ'
				fill_in 'user[first_name_kana]', with: 'ハナコ'
				fill_in 'user[nickname]', with: 'hanako'
				fill_in 'user[email]', with: 'h@h'
				fill_in 'user[password]', with: 'hhhhhh'
				fill_in 'user[password_confirmation]', with: 'hhhhhh'
				click_button '会員登録する'
				expect(page).to have_content '投稿数'
			end
			it '新規登録に失敗する' do
				fill_in 'user[last_name]', with: ''
				fill_in 'user[first_name]', with: ''
				fill_in 'user[last_name_kana]', with: ''
				fill_in 'user[first_name_kana]', with: ''
				fill_in 'user[nickname]', with: ''
				fill_in 'user[email]', with: ''
				fill_in 'user[password]', with: ''
				fill_in 'user[password_confirmation]', with: ''
				click_button '会員登録する'
				expect(page).to have_content 'errors'
			end
		end
	end
	describe 'ユーザーログイン' do
		let(:user) { create(:user) }
		before do
			visit new_user_session_path
		end
		context 'ログイン画面に遷移' do
			let(:test_user) { user }
			it 'ログインに成功する' do
				fill_in 'user[email]', with: test_user.email
				fill_in 'user[password]', with: test_user.password
				click_button 'Log in'
				expect(page).to have_content '投稿数'
			end
			it 'ログインに失敗する' do
				fill_in 'user[email]', with: ''
				fill_in 'user[password]', with: ''
				click_button 'Log in'
				expect(current_path).to eq(new_user_session_path)
			end
		end
	end
end