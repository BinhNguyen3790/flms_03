class Book < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :request_details, dependent: :destroy
  has_many :requests, dependent: :destroy
  belongs_to :author
  belongs_to :publisher
  belongs_to :category
  validates :name, presence: true, length: {maximum: Settings.book.name}
  validates :image, presence: true
  validates :content, presence: true, length: {maximum: Settings.book.content}
  validates :quantity, presence: true, length: {maximum: Settings.book.quantity}
  validates :year, presence: true
  validates :number_of_pages, presence: true,
    length: {maximum: Settings.book.pages}
  delegate :name, to: :author, prefix: :author
  delegate :name, to: :category, prefix: :category
  delegate :name, to: :publisher, prefix: :publisher
  scope :newest, ->{order created_at: :desc}
  scope :alphabet, ->{order name: :asc}

  def comments_newest
    comments.newest
  end

  def self.to_csv
    attributes = %w(id name content number_of_pages quantity)
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |book|
        csv << attributes.map{|attr| book.send(attr)}
      end
    end
  end

  def update_avg_rating
    update_attribute :avg_rating, ratings.sum(:rate) / ratings.count
  end
end
