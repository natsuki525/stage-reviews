require 'rails_helper'

describe User::UsersController, type: :system do
	let(:user) { create(:user) }
  	let!(:test_user2) { create(:user) }
  	let!(:review) { create(:review, user: user) }

  	before do
  		visit new_user_session_path
		  fill_in 'user[email]', with: user.email
		  fill_in 'user[password]', with: user.password
		  click_button 'Log in'
  	end

  	describe '#show' do
  		context '表示の確認' do
  			before do
  				visit user_path(user)
  			end
  			it 'アカウント名と表示される' do
  				expect(page).to have_content 'アカウント名'
  			end
  			it 'emailと表示される' do
  				expect(page).to have_content 'email'
  			end
  			it 'アカウント名が表示される' do
  				expect(page).to have_content user.nickname
  			end
  			it 'emailが表示される' do
  				expect(page).to have_content user.email
  			end
        it 'Favリンクが表示される' do
          expect(page).to have_link '', href: user_favorites_path(user)
        end
        it 'Clipリンクが表示される' do
          expect(page).to have_link '', href: user_clips_path(user)
        end
        it '劇場リンクが表示される' do
          expect(page).to have_link '', href: user_theaters_path(user)
        end
        it 'フォロー中リンクが表示される' do
          expect(page).to have_link '', href: follows_user_path(user)
        end
        it 'フォロワーリンクが表示される' do
          expect(page).to have_link '', href: followers_user_path(user)
        end
  		end
  	end

end