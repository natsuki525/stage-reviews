class AddTroupeNameToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :troupe_name, :string
  end
end
