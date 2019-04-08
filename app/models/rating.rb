class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :rate, presence: true
end
