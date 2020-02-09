class AddTheaterNameToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :theater_name, :string
  end
end
