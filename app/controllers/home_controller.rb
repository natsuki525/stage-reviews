class HomeController < ApplicationController

 def top
 	@reviews = Review.order(created_at: :desc).page(params[:page]).per(12)
 end

 def about
 end

end
