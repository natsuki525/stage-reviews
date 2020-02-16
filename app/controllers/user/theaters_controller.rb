class User::TheatersController < ApplicationController

 def index
 	user = User.find(params[:user_id])
 	# @theaters = Theater.joins(:user).select("theaters.name")
 	@theaters = user.theaters
 end

 def show
 	@theaters = Theater.all
 end

 def edit
 	@theater = Theater.find(params[:id])
 end

 def update
 	@theater = Theater.find(params[:id])
 	if @theater.update(theater_params)
 		redirect_to user_theaters_path
 		flash[:notice_update] = "劇場名を更新しました！"
 	else
 		render :edit
 	end
 end

 private
	def theater_params
		params.require(:theater).permit(:name)
	end

end
