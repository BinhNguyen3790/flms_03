class Category < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.category.name}
  scope :newest, ->{order created_at: :desc}
  scope :alphabet, ->{order name: :asc}
  validates :image, presence: true

  def self.to_csv
    attributes = %w(name image created_at updated_at)
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |category|
        csv << attributes.map{|attr| category.send(attr)}
      end
    end
  end
end
