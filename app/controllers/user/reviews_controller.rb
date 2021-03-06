class User::ReviewsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

 def new
 	@review = Review.new
 end

 def create
 	case params[:selected_btn]
 		when  'been_theater'
      @review = Review.new(review_params)
 			@review.user_id = current_user.id
 			@review.theater_name = Theater.find(params[:review][:theater]).name
      @theaters = Theater.where(user_id: current_user.id)
      @review.score = Language.get_data(review_params[:body])
 			if @review.save
 				redirect_to root_path
 				flash[:notice_review_new] = "レビューが投稿されました！"
 			else
 				render :new
 			end
		when 'new_theater'
			@review = Review.new(review_params)
 			@review.user_id = current_user.id
      @review.score = Language.get_data(review_params[:body])
 			if @review.save
 				@theater = Theater.new
 				@theater.user_id = current_user.id
 				@theater.name = @review.theater_name
 				@theater.save
 				redirect_to root_path
        flash[:notice_review_new] = "レビューが投稿されました！"
 			else
 				render :new
 			end
 		end

 end

 def index
 end

 def show
 	@review = Review.find(params[:id])
 	@user = @review.user
 end

 def edit
 	@review = Review.find(params[:id])
  @user = @review.user
  if @review.user != current_user
      redirect_to review_path(@review)
  end
 end

 def update
 	case params[:selected_btn]
 		when  'been_theater'
      		@review = Review.find(params[:id])
 			    @review.theater_name = Theater.find(params[:review][:theater]).name
          @review.score = Language.get_data(review_params[:body])
 			if @review.update(review_params)
 				redirect_to review_path(@review)
 				flash[:notice_review_update] = "レビューが更新されました！"
 			else
 				render :edit
 			end
 		end
 end

 def destroy
 	@review = Review.find(params[:id])
 	if @review.user = current_user
 		@review.destroy
 		redirect_to root_path
 		flash[:notice_review_destroy] = "レビューが削除されました。"
 	end
 end

 private
    def review_params
      params.require(:review).permit(:user_id, :title, :body, :stage_date, :theater_id, :seat, :view_level, :satisfaction_level, :story_level, :stage_set_level, :costume_level, :image, :theater_name, :is_spoiler, :troupe_name, :created_at, :updated_at)
    end
end
