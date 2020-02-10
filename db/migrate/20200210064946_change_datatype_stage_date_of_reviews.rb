class ChangeDatatypeStageDateOfReviews < ActiveRecord::Migration[5.2]
  def change
  	change_column :reviews, :stage_date, :string
  end
end
