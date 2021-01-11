class User < ApplicationRecord

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :properties, dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :comments, dependent: :destroy

  before_validation { self.email = self.email.downcase }

  validates :username, presence: true, length: { maximum: 25 }, uniqueness: { case_sensetive: false }
  validates :email, presence: true, length: { maximum: 30 }, uniqueness: { case_sensetive: false }, format: { with: VALID_EMAIL_REGEX }

  def self.sign_in_from_omniauth( auth )
    find_by(provider: auth[ "provider" ], uid: auth[ "uid" ] ) || create_user_from_omniauth( auth )
  end

  def self.create_user_from_omniauth( auth )
    create(
      provider: auth[ "provider" ],
      uid: auth[ "uid" ],
      username: auth[ "info" ][ "name" ],
      email: auth[ "info" ][ "email" ],
      password: "password"
    )
  end

  scope :users_count, -> { where(admin: false ).count }

end
