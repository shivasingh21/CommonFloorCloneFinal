require "rails_helper"

RSpec.describe Category, type: :model do
    let(:category) { FactoryBot.create(:category) }

  describe " category name presence" do
    context "when category name is present" do
      it "category name is valid" do
        expect(category).to be_valid
      end
    end
    context "when category name not is present" do
      it "category name not present is invalid" do
        category.name = ""
        expect(category).not_to be_valid
      end
    end
  end

end
