class Book < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :request_details, dependent: :destroy
  belongs_to :author
  belongs_to :publisher
  belongs_to :category
  validate :name, presence: true, length: {maximun: Settings.book.name}
  validate :author, presence: true, length: {maximun: Settings.book.author}
  validate :category, presence: true, length: {maximun: Settings.book.category}
  validate :content, presence: true, length: {maximun: Settings.book.content}
  validate :publisher, presence: true,
    length: {maximun: Settings.book.publisher}
  validate :quantity, presence: true, length: {maximun: Settings.book.quantity}
  validate :year, presence: true
  validate :number_of_pages, presence: true,
    length: {maximun: Settings.book.pages}
end
