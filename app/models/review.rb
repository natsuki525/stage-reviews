class Review < ApplicationRecord
 belongs_to :user
 attachment :image
end
