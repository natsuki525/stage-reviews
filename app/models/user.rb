class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def active_for_authentication?
  #   super && self.is_deleted == false
  # end

  has_many :reviews, dependent: :destroy
  has_many :theaters, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_reviews, through: :favorites, source: :review, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :clip_reviews, through: :clips, source: :review, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower, dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following, dependent: :destroy
  attachment :image
  accepts_nested_attributes_for :theaters

  validates :email, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :nickname, presence: true, format: {with: /\A[a-z0-9]+\z/, message: 'は英数字で入力して下さい。'}
  def followed_by?(user)
  	passive_relationships.find_by(following_id: user.id).present?
  end

  ransacker :full_name do |parent|
  Arel::Nodes::InfixOperation.new('||',
    parent.table[:last_name], parent.table[:first_name])
  end
end
