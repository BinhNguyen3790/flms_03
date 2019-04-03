class Author < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  has_many :books, dependent: :destroy
  has_many :follows, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.author.name}
  validates :email, presence: true, length: {maximum: Settings.author.email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :avatar, presence: true
  validates :profile, presence: true, length: {maximum: Settings.author.profile}
  validates :password, presence: true, length:
    {maximum: Settings.author.password}
end
