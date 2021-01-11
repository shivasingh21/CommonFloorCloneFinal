class Category < ApplicationRecord

  before_validation { self.name = self.name.capitalize }
  validates :name, presence: true, uniqueness: { case_sensetive: false }

end
