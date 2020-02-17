class HomeController < ApplicationController

 def top
 	@reviews = Review.page(params[:page]).per(12)
 end

 def about
 end

end
