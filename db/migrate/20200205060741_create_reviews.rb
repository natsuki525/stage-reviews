class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.datetime :stage_date
      t.integer :theater_id
      t.string :seat
      t.integer :view_level
      t.integer :satisfaction_level
      t.integer :story_level
      t.integer :stage_set_level
      t.integer :costume_level
      t.integer :image_id

      t.timestamps
    end
  end
end
