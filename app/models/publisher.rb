class Publisher < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.publisher.name}
  scope :alphabet, ->{order name: :asc}
end
