class Book < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :request_details, dependent: :destroy
  belongs_to :author
  belongs_to :publisher
  belongs_to :category
  validates :name, presence: true, length: {maximum: Settings.book.name}
  validates :author, presence: true, length: {maximum: Settings.book.author}
  validates :category, presence: true, length: {maximum: Settings.book.category}
  validates :content, presence: true, length: {maximum: Settings.book.content}
  validates :publisher, presence: true,
    length: {maximum: Settings.book.publisher}
  validates :quantity, presence: true, length: {maximum: Settings.book.quantity}
  validates :year, presence: true
  validates :number_of_pages, presence: true,
    length: {maximum: Settings.book.pages}
  delegate :name, to: :author, prefix: :author
  scope :newest, ->{order created_at: :desc}
end
