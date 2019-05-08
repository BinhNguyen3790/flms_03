class Category < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.category.name}
  scope :newest, ->{order created_at: :desc}
  scope :alphabet, ->{order name: :asc}
  validates :image, presence: true
end
