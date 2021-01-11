class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :property

  validates :rating, presence: true, inclusion: { in: 0..5 }, numericality: true
  validates :comment, presence: true, allow_blank: false

end
