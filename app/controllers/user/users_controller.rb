class User::UsersController < ApplicationController
  before_action :authenticate_user!

 def show
 	@user = User.find(params[:id])
  @reviews = @user.reviews.page(params[:page]).per(5).order('created_at DESC')
  @theaters = @user.theaters
 end

 def edit
 	@user = User.find(params[:id])
  if @user != current_user
      redirect_to user_path(current_user)
  end
 end

 def update
 	@user = User.find(params[:id])
 	if @user.update(user_params)
 		redirect_to user_path(current_user)
 		flash[:notice_user_update] = "会員情報が更新されました!"
 	else
 		render 'edit'
 	end
 end

 def follows
    user = User.find(params[:id])
    @users = user.followings.page(params[:page]).per(12)
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers.page(params[:page]).per(12)
  end

  def leave
    @user = User.find(params[:id])
  end

  def update_dl
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

 private
	def user_params
		params.require(:user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:nickname,:email,:image)
	end
end
