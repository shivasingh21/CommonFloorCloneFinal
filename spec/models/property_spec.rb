require "rails_helper"

RSpec.describe Property, type: :model do

  let(:property) { FactoryBot.create(:property) }

  describe " address presence" do
    context "when address is present" do
      it "address is present is valid" do
        expect(property).to be_valid
      end
    end
    context "when address not is present" do
      it "address not present is invalid" do
        property.address = nil
        expect(property).not_to be_valid
      end
    end
  end

  describe " price presence" do
    context "when price is present" do
      it "price is present is valid" do
        expect(property).to be_valid
      end
    end
    context "when price not is present" do
      it "price not present is invalid" do
        property.price = nil
        expect(property).not_to be_valid
      end
    end
  end

  describe " area presence" do
    context "when area is present" do
      it "area is present is valid" do
        expect(property).to be_valid
      end
    end
    context "when area not is present" do
      it "area not present is invalid" do
        property.area = nil
        expect(property).not_to be_valid
      end
    end
  end

  describe " owner_name presence" do
    context "when owner_name is present" do
      it "owner_name is present is valid" do
        expect(property).to be_valid
      end
    end
    context "when owner_name not is present" do
      it "owner_name not present is invalid" do
        property.owner_name = nil
        expect(property).not_to be_valid
      end
    end
  end
  describe " contact_person presence" do
    context "when contact_person is present" do
      it "contact_person is present is valid" do
        expect(property).to be_valid
      end
    end
    context "when contact_person not is present" do
      it "contact_person not present is invalid" do
        property.contact_person = nil
        expect(property).not_to be_valid
      end
    end
  end
  describe " phone_number presence" do
    context "when phone_number is present" do
      it "phone_number is present is valid" do
        expect(property).to be_valid
      end
    end
    context "when phone_number not is present" do
      it "phone_number not present is invalid" do
        property.phone_number = nil
        expect(property).not_to be_valid
      end
    end
  end
  describe " property_status presence" do
    context "when property_status is present" do
      it "property_status is present is valid" do
        expect(property).to be_valid
      end
    end
    context "when property_status not is present" do
      it "property_status not present is invalid" do
        property.property_status = nil
        expect(property).not_to be_valid
      end
    end
  end
  describe " property_type presence" do
    context "when property_type is present" do
      it "property_type is present is valid" do
        expect(property).to be_valid
      end
    end
    context "when property_type not is present" do
      it "property_type not present is invalid" do
        property.property_type = nil
        expect(property).not_to be_valid
      end
    end
  end
  describe " price is numeric" do
    context "when price is numeric" do
      it "price is numeric is valid" do
        expect(property).to be_valid
      end
    end
    context "when price not is numeric" do
      it "price not numeric is invalid" do
        property.price = "aa"
        expect(property).not_to be_valid
      end
    end
  end
  describe " area is numeric" do
    context "when area is numeric" do
      it "area is numeric is valid" do
        expect(property).to be_valid
      end
    end
    context "when area not is numeric" do
      it "area not numeric is invalid" do
        property.area = "aa"
        expect(property).not_to be_valid
      end
    end
  end
  describe " phone_number is numeric" do
    context "when phone_number is numeric" do
      it "phone_number is numeric is valid" do
        expect(property).to be_valid
      end
    end
    context "when phone_number not is numeric" do
      it "phone_number not numeric is invalid" do
        property.phone_number = "aa"
        expect(property).not_to be_valid
      end
    end
  end
  describe " address length is between 10 to 255 characters" do
    context "when address length is between 10 to 255 characters" do
      it "address length is between 10 to 255 characters is valid" do
        expect(property).to be_valid
      end
    end
    context "when address length is not between 10 to 255 characters" do
      it "address length is not between 10 to 255 characters is invalid" do
        property.address = "aa"
        expect(property).not_to be_valid
      end
    end
  end
  describe " owner_name is between 3 to 50 characters" do
    context "when owner_name length is between 3 to 50 characters" do
      it "owner_name length is between 3 to 50 characters is valid" do
        expect(property).to be_valid
      end
    end
    context "when owner_name length is not between 3 to 50 characters" do
      it "owner_name length is not between 3 to 50 characters is invalid" do
        property.owner_name = "aa"
        expect(property).not_to be_valid
      end
    end
  end
  describe " contact_person length is between 10 to 255 characters" do
    context "when contact_person length is between 10 to 255 characters" do
      it "contact_person length is between 10 to 255 characters is valid" do
        expect(property).to be_valid
      end
    end
    context "when contact_person length is not between 10 to 255 characters" do
      it "contact_person length is not between 10 to 255 characters is invalid" do
        property.contact_person = "aa"
        expect(property).not_to be_valid
      end
    end
  end
  describe " phone_number length is 10 characters" do
    context "when phone_number length is 10 characters" do
      it "phone_number length is 10 characters is valid" do
        expect(property).to be_valid
      end
    end
    context "when phone_number length is not 10 characters" do
      it "phone_number length is not 10 characters is invalid" do
        property.phone_number = 2
        expect(property).not_to be_valid
      end
    end
  end
  describe " property_image have valid content type" do
    context "property_image have valid content type" do
      it "property_image has valid content type is valid" do
        expect(property).to be_valid
      end
    end
    context "property_image doesnot have valid content type" do
      it "property_image doesnot have valid content type is invalid" do
          property.property_image.attach(io: File.open('spec/fixtures/temp.xlsx'), filename: 'temp.xlsx', content_type: 'application/xlsx')
        expect(property).not_to be_valid
      end
    end
  end

  describe "association" do
    it { should have_many(:favorites) }
    it { should have_many(:comments) }
    it { should have_many(:property_purchase_details) }
  end

end
