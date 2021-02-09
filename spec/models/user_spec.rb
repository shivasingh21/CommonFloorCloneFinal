require "rails_helper"

RSpec.describe User, type: :model do

  subject(:user1) { FactoryBot.build(:user1)}


  describe "association" do
    it { should have_many(:properties) }
    it { should have_many(:favorites) }
    it { should have_many(:comments) }
    it { should have_many(:property_purchase_details) }
  end
  
  describe " username presence" do
    context "when username is present" do
      it "user having an username is valid" do
        expect(user1).to be_valid
      end
    end
    context "when username is not present" do
      it "user having no username is invalid" do
        user1.username = ""
        expect(user1).not_to be_valid
      end
    end
  end

  describe " user username length" do
    context "with valid username length" do
      it "user having username of length less than 25 characters is valid" do
        expect(user1).to be_valid
      end
    end
    context "with invalid username length" do
      it "user not having username of length less than 25 characters is invalid" do
        user1.username = "g123456789123456789123456789123456789132"
        expect(user1).not_to be_valid
      end
    end
  end

  describe " user username uniqueness" do
    let(:user2) { FactoryBot.create(:user2) }
    context "with unique username" do
      it "user having unique username is valid" do
        expect(user2).to be_valid
      end
    end

    context "with non-unique username" do
      it "user not having unique username is invalid" do
        user1.username = user2.username
        expect(user1).not_to be_valid
      end
    end
  end

  describe " user email presence" do
    context "when email is present" do
      it "user having an email is valid" do
        expect(user1).to be_valid
      end
    end
    context "when email is not present" do
      it "user having no email is invalid" do
        user1.email = ""
        expect(user1).not_to be_valid
      end
    end
  end

  describe " user email length" do
    context "with valid email length" do
      it "user having email of length less than 40 characters is valid" do
        expect(user1).to be_valid
      end
    end
    context "with invalid email length" do
      it "user not having email of length less than 40 characters is invalid" do
        user1.email = "g123456789123456789123456789123456789132.in"
        expect(user1).not_to be_valid
      end
    end
  end

  describe " user email format" do
    context "with valid email format" do
      it "user containing valid email format " do
        expect(user1).to be_valid
      end
    end
    context "with invalid email format" do
      it "user not containing valid email format " do
        user1.email = "temp.com"
        expect(user1).not_to be_valid
      end
    end
  end

  describe " user email uniqueness" do
    let(:user2) { FactoryBot.create(:user2) }
    context "with unique email" do
      it "user having unique email is valid" do
        expect(user2).to be_valid
      end
    end

    context "with non-unique email" do
      it "user not having unique email is invalid" do
        user1.email = user2.email
        expect(user1).not_to be_valid
      end
    end
  end

  describe " user password presence" do
    context "when password is present" do
      it "user having a password is valid" do
        expect(user1).to be_valid
      end
    end
    context "when password is not present" do
      it "user having no password is invalid" do
        user1.password = nil
        expect(user1).not_to be_valid
      end
    end
  end

  describe " user email presence" do
    context "when email is present" do
      it "user having an email is valid" do
        expect(user1).to be_valid
      end
    end
    context "when email is not present" do
      it "user having no email is invalid" do
        user1.email = ""
        expect(user1).not_to be_valid
      end
    end
  end

  describe " user email length" do
    context "with valid email length" do
      it "user having email of length less than 40 characters is valid" do
        expect(user1).to be_valid
      end
    end
    context "with invalid email length" do
      it "user not having email of length less than 40 characters is invalid" do
        user1.email = "g123456789123456789123456789123456789132@mail.com"
        expect(user1).not_to be_valid
      end
    end
  end

  describe "from omniauth" do
    context "with registered user" do
      it "using omniauth" do
        user1 = FactoryBot.create(:user1, email: "temp@facebook.com", provider: "facebook", uid: "12345678910")
        OmniAuth.config.test_mode = true
        expect(User.create_user_from_omniauth(OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
          provider: "facebook",
            uid: "12345678910",
            info: {
              email: "demo@gmail.com",
              name: "Shiva"
            },
            password: "temp",
            credentials: {
              token: "abcdefg12345",
              refresh_token: "abcdefg12345",
              expires_at: DateTime.now,
            }
          }))).not_to eq(user1)
      end
    end
  end



end
