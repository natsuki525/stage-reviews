class User::TheatersController < ApplicationController
	before_action :authenticate_user!

 def index
 	@user = User.find(params[:user_id])
 	@theaters = @user.theaters.page(params[:page]).per(10)
 end

 def edit
 	@theater = Theater.find(params[:id])
 	@user = @theater.user
 	if @theater.user != current_user
 		redirect_to user_theaters_path
 	end
 end

 def update
 	@user = User.find(params[:user_id])
 	@theater = Theater.find(params[:id])
 	if @theater.update(theater_params)
 		redirect_to user_theaters_path(@user)
 		flash[:notice_theater_update] = "劇場名を更新しました！"
 	else
 		render 'edit'
 	end
 end

 private
	def theater_params
		params.require(:theater).permit(:name)
	end

end
