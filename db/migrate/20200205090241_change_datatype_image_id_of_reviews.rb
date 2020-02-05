class ChangeDatatypeImageIdOfReviews < ActiveRecord::Migration[5.2]
  def change
  	change_column :reviews, :image_id, :string
  end
end
