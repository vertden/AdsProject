require 'rails_helper'

RSpec.describe Ad, type: :model do
  context "validation tests" do
    it "ensures body should is present" do
      ad = Ad.new(type_id: 1, user_id: 1)
      expect(ad.valid?).to eq(false)
    end
    it "ensures body length should greater 5" do
      ad = Ad.new(body: "1",type_id: 1, user_id: 1)
      expect(ad.valid?).to eq(false)
    end
    it "should be able to save ad" do
      ad = Ad.new(body: "Some text", type_id: 1, user_id: 1)
      expect(ad.save).to eq(true)
    end

  end
end
