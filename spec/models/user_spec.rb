require "rails_helper"

RSpec.describe User, type: :model do

  context "validation tests" do
    let(:user) { build(:user) }
    it "ensure username presence" do
      user.username = nil
      expect(user.save).to eq(false)
    end
    it "ensure password presence" do
      user.password = nil
      expect(user.save).to eq(false)
    end
    it "ensure maximum username lenth" do
      user.username = "123456789012345678901234567"
      expect(user.save).to eq(false)
    end
    it "ensure maximum email lenth" do
      user.email = "123456789012345678901234567@ggggggggg.com"
      expect(user.save).to eq(false)
    end
    it "ensure email format" do
      user.email = "adscx.com"
      expect(user.save).to eq(false)
    end

  end

end
