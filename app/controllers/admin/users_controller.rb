class Admin::UsersController < ApplicationController

 def index
 	@search_u = User.with_deleted.ransack(params[:q])
 	@users = @search_u.result.page(params[:page])
 end

 def show
 	@user = User.with_deleted.find(params[:id])
 end

 def edit
 	@user = User.with_deleted.find(params[:id])
 end

 def update
 	@user = User.with_deleted.find(params[:id])
 	if params[:user][:deleted_at] == "true"
 		@user.restore
 	else
 		@user.destroy
 	end
 		redirect_to admin_user_path(@user)
 end

 private
	def user_params
		params.require(:user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:nickname,:email,:is_deleted)
	end
end
