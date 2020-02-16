class User::TheatersController < ApplicationController

 def index
 	@user = User.find(params[:user_id])
 	@theaters = @user.theaters
 end

 def edit
 	@theater = Theater.find(params[:id])
 end

 def update
 	@user = User.find(params[:user_id])
 	@theater = Theater.find(params[:id])
 	if @theater.update(theater_params)
 		redirect_to user_user_theaters_path(@user)
 		flash[:notice_update] = "劇場名を更新しました！"
 	else
 		render :edit
 	end
 end

 def destroy
 	@user = User.find(params[:user_id])
 	@theater = Theater.find(params[:id])
 	if @theater.user = current_user
 		@theater.destroy
 		redirect_to user_user_theaters_path(@user, @theater)
 		# flash[:notice_destroy] = "劇場が削除されました。"
 	end
 end

 private
	def theater_params
		params.require(:theater).permit(:name)
	end

end
