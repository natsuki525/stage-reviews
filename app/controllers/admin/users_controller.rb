class Admin::UsersController < ApplicationController

 def index
 	@search_u = User.ransack(params[:q])
 	@users = @search_u.result.page(params[:page])
 end

 def show
 	@user = User.find(params[:id])
 end

 def edit
 	@user = User.find(params[:id])
 end

 def update
 	@user = User.find(params[:id])
 	if @user.update(user_params)
 		redirect_to admin_user_path(@user)
 		flash[:notice_edit] = "会員情報が更新されました!"
 	else
 		render :edit
 	end
 end

 private
	def user_params
		params.require(:user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:nickname,:email,:is_deleted)
	end
end
