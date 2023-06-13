require 'spec_helper.rb'

RSpec.describe Visitor do
  before do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  describe "#exists" do
    it "exists with readable attributes" do
      expect(@visitor1).to be_an_instance_of(Visitor)
      expect(@visitor1.name).to eq("Bruce")
      expect(@visitor1.height).to eq(54)
      expect(@visitor1.spending_money).to eq(10)
      expect(@visitor1.preferences).to eq([])
    end
  end

  describe "#add_preferences" do
    it "can add a preference about a type of ride" do
      @visitor1.add_preference(:gentle)
      @visitor1.add_preference(:thrilling)

      expect(@visitor1.preferences).to eq([:gentle, :thrilling])
    end
  end
end