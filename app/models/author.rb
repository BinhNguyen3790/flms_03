class Author < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :books, dependent: :destroy
  has_many :follows, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.author.name}
  validates :avatar, presence: true
  validates :profile, presence: true, length: {maximum: Settings.author.profile}
  scope :alphabet, ->{order :name}
end
