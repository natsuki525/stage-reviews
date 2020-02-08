class Review < ApplicationRecord
 belongs_to :user
 attachment :image

 # enum view_level: {★:1, ★★:2, ★★★:3, ★★★★:4, ★★★★★:5}
 # enum satisfaction_level: {★:1, ★★:2, ★★★:3, ★★★★:4, ★★★★★:5}
 # enum story_level: {★:1, ★★:2, ★★★:3, ★★★★:4, ★★★★★:5}
 # enum stage_set_level: {★:1, ★★:2, ★★★:3, ★★★★:4, ★★★★★:5}
 # enum costume_level: {★:1, ★★:2, ★★★:3, ★★★★:4, ★★★★★:5}
end
