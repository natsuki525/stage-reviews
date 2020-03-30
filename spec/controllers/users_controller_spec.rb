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
  		it 'アカウント名が表示される' do
  			expect(page).to have_content user.nickname
  		end
  		it 'emailが表示される' do
  			expect(page).to have_content user.email
  		end
      it 'Favリンク先が正しい' do
        expect(page).to have_link '', href: user_favorites_path(user)
      end
      it 'Clipリンク先が正しい' do
        expect(page).to have_link '', href: user_clips_path(user)
      end
      it '劇場リンク先が正しい' do
        expect(page).to have_link '', href: user_theaters_path(user)
      end
      it 'フォロー中リンク先が正しい' do
        expect(page).to have_link '', href: follows_user_path(user)
      end
      it 'フォロワーリンク先が正しい' do
        expect(page).to have_link '', href: followers_user_path(user)
      end
      it '投稿のリンク先が正しい' do
        expect(page).to have_link review.title, href: review_path(review)
      end
  	end
  end

  describe '#edit' do
    context '自分の編集画面への遷移' do
      it '遷移できる' do
        visit edit_user_path(user)
        expect(current_path).to eq('/users/' + user.id.to_s + '/edit')
      end
    end
    context '他人の編集画面への遷移' do
      it '遷移できない' do
        visit edit_user_path(test_user2)
        expect(current_path).to eq('/users/' + user.id.to_s)
      end
    end
  end

  describe '#update' do
    before do
      visit edit_user_path(user)
    end
    context '更新の確認' do
      it '更新が成功する' do
        click_button '変更を保存'
        expect(page).to have_content '会員情報が更新されました！'
        expect(current_path).to eq('/users/' + user.id.to_s)
      end
      it '更新が失敗する' do
        fill_in 'user[last_name]', with: ''
        click_button '変更を保存'
        expect(page).to have_content 'error'
        expect(current_path).to eq('/users/' + user.id.to_s)
      end
    end
  end

end