class User::UsersController < ApplicationController

 def show
 	@user = User.find(params[:id])
  @user_review = Review.count
 end

 def edit
 	@user = User.find(params[:id])
 end

 def update
 	@user = User.find(params[:id])
 	if @user.update(user_params)
 		redirect_to user_user_path(current_user)
 		flash[:notice_update] = "商品が更新されました!"
 	else
 		render :edit
 	end
 end

 def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

 private
	def user_params
		params.require(:user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:nickname,:email,:image)
	end
end
