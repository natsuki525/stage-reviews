class RemoveTheaterIdFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :theater_id, :integer
  end
end
