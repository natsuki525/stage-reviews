require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ログインしていない場合' do
    before do
      visit root_path
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'Homeリンクが表示される' do
        is_expected.to have_content 'Home'
      end
      it 'Aboutリンクが表示される' do
        is_expected.to have_content 'About'
      end
      it 'loginリンクが表示される' do
        is_expected.to have_content 'Login'
      end
    end
    context 'ヘッダーのリンクを確認' do
      subject { current_path }
      it 'Home画面に遷移する' do
        click_link 'Home'
        is_expected.to eq(root_path)
      end
      it 'About画面に遷移する' do
        click_link 'About'
        is_expected.to eq(home_about_path)
      end
      it 'ログイン画面に遷移する' do
        click_link 'Login'
        is_expected.to eq(new_user_session_path)
      end
    end
  end

  describe 'ログインしている場合' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'Homeリンクが表示される' do
        is_expected.to have_content 'Home'
      end
      it 'Aboutリンクが表示される' do
        is_expected.to have_content 'About'
      end
      it 'MyPageリンクが表示される' do
        is_expected.to have_content 'MyPage'
      end
      it 'Logoutリンクが表示される' do
        is_expected.to have_content 'Logout'
      end
    end

    context 'ヘッダーのリンクを確認' do
      it 'Home画面に遷移する' do
        click_link 'Home'
        expect(current_path).to eq(root_path)
      end
      it 'About画面に遷移する' do
        click_link 'About'
        expect(current_path).to eq(home_about_path)
      end
      it 'MyPage画面に遷移する' do
        click_link 'MyPage'
        expect(current_path).to eq('/users/'+user.id.to_s)
      end
      # it 'Logoutする' do
      #   click_link 'Logout'
      #   expect(current_path).to eq()
      # end
    end
  end
end