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
  scope :alphabet, ->{order name: :asc}
  delegate :name, to: :book, prefix: :book
  delegate :name, to: :user, prefix: :user
  delegate :email, to: :user, prefix: :user

  def self.to_csv
    attributes = %w(id user_id book_id status from_date to_date quantity)
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |request|
        csv << attributes.map{|attr| request.send(attr)}
      end
    end
  end
end
