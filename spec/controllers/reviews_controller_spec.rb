require 'rails_helper'

describe User::ReviewsController, type: :system do
	let(:user) { create(:user) }
	let(:user2) { create(:user) }
	let(:review) { create(:review, user: user) }
	let(:review2) { create(:review, user: user2) }
	let(:theater) { create(:theater, user: user)}
	let(:theater2) { create(:theater, user: user2)}
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
		# context '「行ったことのある劇場から選択」で投稿' do
		# 	before do
		# 		visit new_review_path
		# 		fill_in 'review[title]', with: 'テスト投稿3'
 	# 			fill_in 'review[stage_date]', with: '2020/3/22 19:00'
 	# 			choose 'selected_btn_new_theater'
 	# 			fill_in 'review[theater_name]', with: 'テスト劇場3'
 	# 			fill_in 'review[seat]', with: '2階F5'
 	# 			select '★', from: 'review[view_level]'
 	# 			select '★', from: 'review[satisfaction_level]'
 	# 			select '★', from: 'review[story_level]'
 	# 			select '★', from: 'review[stage_set_level]'
 	# 			select '★', from: 'review[costume_level]'
 	# 	  		fill_in 'review[body]', with: 'つまらなかった'
 	# 	  		click_button '投稿'
		# 	end
		# 	it '投稿が成功する' do
		# 		review = Review.new { review_id: review, user_id: user }
		# 		review.theater_name = Theater.find { review_id: review, theater_id: theater }
		# 		theaters = Theater.where { user_id: user }
				# visit new_review_path
				# fill_in 'review[title]', with: 'テスト投稿1'
 			# 	fill_in 'review[stage_date]', with: '2020/3/20 13:00'
 			# 	choose 'selected_btn_been_theater'
 			# 	select '', from: 'review[theater]'
 			# 	fill_in 'review[seat]', with: '1階D5'
 			# 	select '★★', from: 'review[view_level]'
 			# 	select '★★', from: 'review[satisfaction_level]'
 			# 	select '★★', from: 'review[story_level]'
 			# 	select '★★', from: 'review[stage_set_level]'
 			# 	select '★★', from: 'review[costume_level]'
 		 #  		fill_in 'review[body]', with: '面白かった'
 		 #  		click_button '投稿'
 		 #  		expect(root_path).to redirect_to root_path
			#end
		#end
		context '「新しい劇場を追加」で投稿' do
			before do
				visit new_review_path
			end
			it '投稿が成功する' do
				fill_in 'review[title]', with: 'テスト投稿2'
 				fill_in 'review[stage_date]', with: '2020/3/20 19:00'
 				choose 'selected_btn_new_theater'
 				fill_in 'review[theater_name]', with: 'テスト劇場2'
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

	describe '#show' do
		context 'ログインの有無は関係なく表示される' do
			before do
				visit review_path(review)
			end
			it '詳細画面に飛べる' do
				expect(page).to have_content '投稿日'
  				expect(page).to have_content '更新日'
  				expect(page).to have_content 'reviewed by'
  				expect(page).to have_content '観劇日'
  				expect(page).to have_content '劇場名'
  				expect(page).to have_content '座席'
  				expect(page).to have_content '座席の見え方'
  				expect(page).to have_content '感想'
  				expect(page).to have_content '評価'
  				expect(page).to have_content '満足度'
  				expect(page).to have_content 'ストーリー性'
  				expect(page).to have_content '舞台セット'
  				expect(page).to have_content '衣装'
			end
			it '投稿詳細内容が表示される' do
  		 		expect(page).to have_content review.user.nickname
				expect(page).to have_content review.title
				expect(page).to have_content review.stage_date
				expect(page).to have_content review.troupe_name
				expect(page).to have_content review.theater_name
				expect(page).to have_content review.seat
				expect(page).to have_content '★'
				expect(page).to have_content review.body
				# expect(page).to have_content review.score
				expect(page).to have_content '★★'
				expect(page).to have_content '★★★'
				expect(page).to have_content '★★★★'
				expect(page).to have_content '★★★★★'
			end
		end
		context 'ログインしている場合' do
			before do
				visit new_user_session_path
				fill_in 'user[email]', with: user.email
				fill_in 'user[password]', with: user.password
				click_button 'Log in'
			end
			it 'favとclipが表示される' do
				visit review_path(review)
  				expect(page).to have_content 'Fav'
  				expect(page).to have_content 'Clip'
			end
			it '投稿者詳細に飛べる' do
				visit review_path(review)
				expect(page).to have_link review.user.nickname, href: user_path(review.user)
			end
			it '編集リンクが表示される(current_userの投稿を確認した場合)' do
				visit review_path(review)
				expect(page).to have_link '編集', href: edit_review_path(review)
			end
			it '削除リンクが表示される(current_userの投稿を確認した場合)' do
				visit review_path(review)
				expect(page).to have_link '削除', href: review_path(review)
			end
			it '編集リンクが表示されない(他人の投稿を確認した場合)' do
				visit review_path(review2)
				expect(page).to have_no_link '編集', href: review_path(review2)
			end
			it '削除リンクが表示されない(他人の投稿を確認した場合)' do
				visit review_path(review2)
				expect(page).to have_no_link '削除', href: review_path(review)
			end
		end
	end

	describe '#edit' do
		before do
			visit new_user_session_path
			fill_in 'user[email]', with: user.email
			fill_in 'user[password]', with: user.password
			click_button 'Log in'
		end
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
				expect(page).to have_content 'レビュー編集'
			end
			it '編集フォームが表示される' do
				expect(page).to have_field 'review[title]'
				expect(page).to have_field 'review[troupe_name]', with: review.troupe_name
 				expect(page).to have_field 'review[stage_date]'
 				choose 'selected_btn_been_theater'
 				expect(page).to have_field 'review[theater_name]', with: review.theater_name
 				expect(page).to have_field 'review[seat]', with: review.seat
 				select '★', from: 'review[view_level]'
 				select '★★', from: 'review[satisfaction_level]'
 				select '★★★', from: 'review[story_level]'
 				select '★★★★', from: 'review[stage_set_level]'
 				select '★★★★★', from: 'review[costume_level]'
 		  		expect(page).to have_field 'review[body]', with: review.body
			end
		end
	end

	describe '#update' do
		before do
			visit new_user_session_path
			fill_in 'user[email]', with: user.email
			fill_in 'user[password]', with: user.password
			click_button 'Log in'
			visit edit_review_path(review)
		end
		it '編集に成功する' do
			click_button '変更を保存'
			expect(page).to have_content 'レビューが更新されました！'
			expect(current_path).to eq '/reviews/' + review.id.to_s
		end
		it '編集に失敗する' do
			fill_in 'review[title]', with: ''
			click_button '変更を保存'
			expect(page).to have_content 'error'
			expect(current_path).to eq '/reviews/' + review.id.to_s
		end
	end
end