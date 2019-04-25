class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  has_many :likes, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :follows, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.user.name}
  validates :email, presence: true, length: {maximum: Settings.user.email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.user.password}, allow_nil: true
  validates :phone, presence: true, length: {maximum: Settings.user.phone}
  validates :address, presence: true, length: {maximum: Settings.user.address}
  scope :alphabet, ->{order name: :asc}
end
