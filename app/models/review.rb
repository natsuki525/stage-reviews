class Review < ApplicationRecord
 belongs_to :user
 has_many :favorites, dependent: :destroy
 has_many :clips, dependent: :destroy
 attachment :image
 attr_accessor :theater

 validates :title, presence: true, length: { maximum: 50}
 validates :body, presence: true, length: { maximum: 300}
 validates :stage_date, presence: true
 validates :theater_name, presence: true

 def favorited_by(user)
 	favorites.where(user_id: user.id).exists?
 end

 def clipped_by(user)
 	clips.where(user_id: user.id).exists?
 end

end
