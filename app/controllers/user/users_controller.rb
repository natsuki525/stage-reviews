class User::UsersController < ApplicationController

 def show
 	@user = current_user
 end

 def edit
 end

 def update
 end

 private
	def user_params
		params.require(:user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:nickname,:email,:image)
	end
end
