class RequestDetail < ApplicationRecord
  belongs_to :request
  belongs_to :book
  validates :status, presence: true
  validates :quantity, presence: true,
    length: {maximum: Settings.request_detail.quantity}
end
