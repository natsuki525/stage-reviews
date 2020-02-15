class Admin::UsersController < ApplicationController

 def index
 	@search_u = User.ransack(params[:q])
 	@users = @search_u.result.page(params[:page])
 end
end
