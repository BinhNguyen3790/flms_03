class Publisher < ApplicationRecord
  has_many :books, dependent: :destroys
  validates :name, presence: true, length: {maximum: Settings.publisher.name}
end
