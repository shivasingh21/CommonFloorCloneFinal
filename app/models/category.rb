class Category < ApplicationRecord
  after_validation { self.name = self.name.capitalize }
  validates :name, presence: true
end
