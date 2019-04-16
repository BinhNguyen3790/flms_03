class Request < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :request_details, dependent: :destroy
  enum status: {pending: 0, accept: 1, deny: 2}
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :quantity, presence: true,
    length: {maximum: Settings.request_detail.quantity}
  scope :newest, ->{order created_at: :desc}
  scope :search_request,
    ->(search){where "name like ?", "%#{search}%" if search.present?}
  delegate :name, to: :book, prefix: :book
end
