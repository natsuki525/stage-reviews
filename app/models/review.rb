class Review < ApplicationRecord
 belongs_to :user
 has_many :favorites, dependent: :destroy
 attachment :image
 attr_accessor :theater

 def favorited_by(user)
 	favorites.where(user_id: user.id).exists?
 end
 # enum view_level: {★:1, ★★:2, ★★★:3, ★★★★:4, ★★★★★:5}
 # enum satisfaction_level: {★:1, ★★:2, ★★★:3, ★★★★:4, ★★★★★:5}
 # enum story_level: {★:1, ★★:2, ★★★:3, ★★★★:4, ★★★★★:5}
 # enum stage_set_level: {★:1, ★★:2, ★★★:3, ★★★★:4, ★★★★★:5}
 # enum costume_level: {★:1, ★★:2, ★★★:3, ★★★★:4, ★★★★★:5}
end
