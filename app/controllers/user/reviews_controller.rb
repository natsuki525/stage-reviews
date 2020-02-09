class User::ReviewsController < ApplicationController

 def new
 	@review = Review.new
 	@theaters = Theater.where(user_id: current_user.id)
 end

 def create
 	case params[:selected_btn]
 		when  'been_theater'
      		@review = Review.new(review_params)
 			@review.user_id = current_user.id
 			@review.theater_name = Theater.find(params[:review][:theater]).name
 			if @review.save
 				redirect_to user_reviews_path
 				# flach[:notice_new] = "レビューが投稿されました！"
 			else
 				render :new
 			end
		when 'new_theater'
			@review = Review.new(review_params)
 			@review.user_id = current_user.id
 			if @review.save
 				@theater = Theater.new
 				@theater.user_id = current_user.id
 				@theater.name = @review.theater_name
 				@theater.save
 				redirect_to user_reviews_path
 			else
 				render :new
 			end
 		end

 end

 def index
 	@reviews = Review.all
 end

 def show
 	@review = Review.find(params[:id])
 end

 def edit
 	@review = Review.find(params[:id])
 end

 def update
 	@review = Review.find(params[:id])
 	if @review.update(review_params)
 		redirect_to review_path(@review)
 		flash[:notice_update] = "レビューが更新されました！"
 	else
 		render :edit
 	end
 end

 def destroy
 	@review = Review.find(params[:id])
 	if @review.user_id = current_user.user_id
 		@review.destroy
 		redirect_to reviews_path
 		flash[:notice_destroy] = "レビューが削除されました。"
 	end
 end

 private
    def review_params
      params.require(:review).permit(:user_id, :title, :body, :stage_date, :theater_id, :seat, :view_level, :satisfaction_level, :story_level, :stage_set_level, :costume_level, :image, :theater_name, :created_at, :updated_at)
    end

end
