require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validation tests' do
    let(:category) { build(:category) }
    it 'ensure category name presence' do
      category.name = nil
      expect(category.save).to eq(false)
    end

  end
end
