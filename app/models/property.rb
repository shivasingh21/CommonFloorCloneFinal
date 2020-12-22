class Property < ApplicationRecord
  belongs_to :user
  has_one_attached :property_image
  has_many :comments, dependent: :destroy
  has_many :favorites,dependent: :destroy

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
  # validate :correct_property_image

  def self.property_search(search_params)
    property = Property.where(approved_status: 'true')
    property = property.where(property_type: search_params[:property_type]) if search_params[:property_type].present?
    property = property.where(property_status: search_params[:property_status]) if search_params[:property_status].present?
    property = property.where(city: search_params[:city]) if search_params[:city].present?
    return property
  end

  # def self.correct_property_image
  #   if property_image.attached? && !property_image.content_type.in(%w(image/jpeg image/png))
  #     errors.add(:property_image, 'Image must be a JPEG or PNG')
  #     flash.now[:danger] = "Image must be a JPEG or PNG"
  #   end
  # end
end
