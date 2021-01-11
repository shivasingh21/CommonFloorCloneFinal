class Property < ApplicationRecord

  belongs_to :user
  has_one_attached :property_image
  has_many :comments, dependent: :destroy
  has_many :favorites,dependent: :destroy

  before_validation { self.city = self.city.upcase }

  validates :address, presence: true, length: { minimum: 10, maximum: 255 }
  validates :price, presence: true, numericality: true
  validates :area, presence: true, numericality: true
  validates :owner_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :contact_person, presence: true, length: { minimum: 3, maximum: 50 }
  validates :phone_number, presence: true, numericality: true, length: { is: 10 }
  validates :city, presence: true
  validates :property_status, presence: true
  validates :property_type, presence: true
  validates :property_image, attached: true,content_type: [ "image/png", "image/jpg", "image/jpeg" ]


  def self.property_search( search_params, admin )
    if admin
      property = Property.where( approved_status: "false").order("created_at DESC")
    else
      property = Property.where( approved_status: "true").order("created_at DESC")
    end

    property = property.where( property_type: search_params[ :property_type ] ) if search_params[ :property_type ].present?
    property = property.where( property_status: search_params[ :property_status ] ) if search_params[ :property_status ].present?
    property = property.where( city: search_params[ :city ] ) if search_params[ :city ].present?
    return property
  end

  scope :top_picks, -> { where(approved_status: true).first(3) }
  scope :most_recent, -> { where(approved_status: true).last(3) }

  scope :users_property_list, -> (params) { property_search( params, admin = false ).paginate( page: params[:page], per_page: 6 ) }
  scope :admin_property_list, -> (params) { property_search( params, admin = true ).paginate( page: params[:page], per_page: 5) }

end
