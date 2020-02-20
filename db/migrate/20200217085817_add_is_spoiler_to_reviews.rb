class AddIsSpoilerToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :is_spoiler, :boolean, default: false
  end
end
