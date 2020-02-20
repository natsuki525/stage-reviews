class User::ClipsController < ApplicationController
  before_action :authenticate_user!

  def index
 	@user = User.find_by(id: params[:user_id])
    @clips = Clip.where(user_id: @user.id).page(params[:page]).per(12)
  end
  def create
  	@review = Review.find(params[:review_id])
 	clip = current_user.clips.new(review_id: @review.id)
 	clip.save
  end

  def destroy
  	@review = Review.find(params[:review_id])
 	clip = current_user.clips.find_by(review_id: @review.id)
 	clip.destroy
  end
end
