require 'rails_helper'

describe 'レビュー管理機能', type: :system do
	describe '一覧表示機能' do
		before do
			user_a = FactoryBot.create(:user, last_name: '田中',first_name: '花子',email: 't@t' )
			FactoryBot.create(:review, title: '作品A', user: user_a)
			visit user_path
		end
		context 'ユーザーAがログインしている時' do
			before do
				visit new_user_session_path
				fill_in 'user[emal]', with: 't@t'
				fill_in 'user[password]', with: 'yyyyyy'
				click_button 'Log in'
			end

			it 'ユーザーAが作成したタスクが表示される' do
				expect(page).to have_content '作品A'
			end
		end
	end
end