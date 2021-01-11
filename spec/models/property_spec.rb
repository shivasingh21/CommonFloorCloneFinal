require "rails_helper"

RSpec.describe Property, type: :model do

  context "validation tests" do
    let(:property) { build(:property) }

    it "ensure property type presence" do
      property.property_type = nil
      expect(property.save).to eq(false)
    end

    it "ensure property status presence" do
      property.property_status = nil
      expect(property.save).to eq(false)
    end
    it "ensure price presence" do
      property.price = nil
      expect(property.save).to eq(false)
    end
    it "ensure area presence" do
      property.area = nil
      expect(property.save).to eq(false)
    end
    it "ensure owner name presence" do
      property.owner_name = nil
      expect(property.save).to eq(false)
    end
    it "ensure contact person presence" do
      property.contact_person = nil
      expect(property.save).to eq(false)
    end
    it "ensure phone number presence" do
      property.phone_number = nil
      expect(property.save).to eq(false)
    end
    it "ensure phone number length is 10" do
      property.phone_number = 13456789465
      expect(property.save).to eq(false)
    end
    it "ensure price is number" do
      property.price = "asdc"
      expect(property.save).to eq(false)
    end
    it "ensure area is number" do
      property.area = "adsc"
      expect(property.save).to eq(false)
    end
    it "ensure owner name minimum legth" do
      property.owner_name = "A"
      expect(property.save).to eq(false)
    end
    it "ensure contact person minimum legth" do
      property.contact_person = "S"
      expect(property.save).to eq(false)
    end
    it "ensure address presence" do
      property.address = nil
      expect(property.save).to eq(false)
    end
    it "ensure address minimum length" do
      property.address = "asdc"
      expect(property.save).to eq(false)
    end

  end
  
end
