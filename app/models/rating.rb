class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :rate, presence: true
  validates :coontent, presence: true
end
