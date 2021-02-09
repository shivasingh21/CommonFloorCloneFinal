require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:comment) { FactoryBot.create(:comment) }

  describe " comment presence" do
    context "when comment is present" do
      it "comment is present is valid" do
        expect(comment).to be_valid
      end
    end
    context "when comment not is present" do
      it "comment not present is invalid" do
        comment.comment = nil
        expect(comment).not_to be_valid
      end
    end
  end

  describe " rating presence" do
    context "when rating is present" do
      it "rating is present is valid" do
        expect(comment).to be_valid
      end
    end
    context "when rating not is present" do
      it "rating not present is invalid" do
        comment.rating = nil
        expect(comment).not_to be_valid
      end
    end
  end

  describe " rating within desired range" do
    context "when rating is between 0 to 5" do
      it "rating is between 0 to 5 is valid" do
        expect(comment).to be_valid
      end
    end
    context "when rating not is between 0 to 5" do
      it "rating not between 0 to 5 is invalid" do
        comment.rating = 8
        expect(comment).not_to be_valid
      end
    end
  end

  describe " rating is numeric" do
    context "when rating is numeric" do
      it "rating is numeric is valid" do
        expect(comment).to be_valid
      end
    end
    context "when rating not is numeric" do
      it "rating not numeric is invalid" do
        comment.rating = "aa"
        expect(comment).not_to be_valid
      end
    end
  end

  describe "association" do
    it { should belong_to(:user) }
    it { should belong_to(:property) }
  end

end
