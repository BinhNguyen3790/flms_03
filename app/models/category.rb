class Category < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.category.name}
  scope :newest, ->{order created_at: :desc}
  scope :search_category,
    ->(search){where "name like ?", "%#{search}%" if search.present?}
end
