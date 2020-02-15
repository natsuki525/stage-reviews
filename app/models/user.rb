class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && self.is_deleted == false
  end

  has_many :reviews, dependent: :destroy
  has_many :theaters, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_reviews, through: :favorites, source: :review
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  attachment :image
  accepts_nested_attributes_for :theaters

  def followed_by?(user)
  	passive_relationships.find_by(following_id: user.id).present?
  end

  ransacker :full_name do |parent|
  Arel::Nodes::InfixOperation.new('||',
    parent.table[:last_name], parent.table[:first_name])
  end
end
