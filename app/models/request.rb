class Request < ApplicationRecord
  belongs_to :user
  has_many :request_details, dependent: :destroy
  validates :from_date, presence: true
  validates :to_date, presence: true
end
