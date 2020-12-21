class Property < ApplicationRecord
  belongs_to :user
  has_one_attached :property_image
  has_many :reviews, dependent: :destroy

  after_validation { self.city = self.city.upcase }

  validates :address, presence: true, length: {minimum: 10, maximum: 255}
  validates :price, presence: true, numericality: true
  validates :area, presence: true, numericality: true
  validates :owner_name, presence: true, length: {minimum: 3, maximum: 50}
  validates :contact_person, presence: true, length: {minimum: 3, maximum: 50}
  validates :phone_number, presence: true, numericality: true, length: { is: 10 }
  validates :city, presence: true
  validates :property_status, presence: true
  validates :property_type, presence: true
end
