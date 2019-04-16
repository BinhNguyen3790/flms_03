class RequestDetail < ApplicationRecord
  belongs_to :request
  belongs_to :book
  enum status: {pending: 0, accept: 1, deny: 2}
  validates :quantity, presence: true,
    length: {maximum: Settings.request_detail.quantity}
end
