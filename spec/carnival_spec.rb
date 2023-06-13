require 'spec_helper.rb'

RSpec.describe Carnival do
  before do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')

    @visitor1.add_preference(:gentle)

    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling)

    @visitor3.add_preference(:thrilling)

    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    @carnival = Carnival.new("Turing's Wild Ride", 242)

    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)
  end

  describe "#exists" do
    it "exists with readable attributes" do
      expect(@carnival).to be_an_instance_of(Carnival)
      expect(@carnival.name).to eq("Turing's Wild Ride")
      expect(@carnival.duration).to eq(242)
      expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
    end
  end

  describe "#most_popular_ride" do
    it "can return the ride with the highest number of recorded riders" do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor3)

      expect(@carnival.most_popular_ride).to eq(@ride1)
    end
  end

  describe "#most_profitable_ride" do
    it "can return the ride with the highest amount of total revenue" do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      3.times do
        @ride3.board_rider(@visitor3)
      end

      expect(@carnival.most_profitable_ride).to eq(@ride3)
    end
  end

  describe "#total_revenue" do
    it "can calculate the total revenue earned from all rides" do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      3.times do
        @ride3.board_rider(@visitor3)
      end

      expect(@carnival.total_revenue).to eq(9)
    end
  end

  describe "#summary" do
    it "can return a hash that summarizes carnival information" do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      3.times do
        @ride3.board_rider(@visitor3)
      end
      
      expected = {
        visitor_count: 3, 
        revenue_earned: 9, 
        visitors: [
          {
            visitor: @visitor1,
            favorite_ride: @ride1,
            total_money_spent: 2
          }, 
          {
            visitor: @visitor2,
            favorite_ride: @ride1,
            total_money_spent: 1
          },
          {
            visitor: @visitor3,
            favorite_ride: @ride3,
            total_money_spent: 6
          }],
        rides: [
          {
            ride: @ride1,
            riders: [@visitor1, @visitor2],
            total_revenue: 3
          },
          {
            ride: @ride2,
            riders: [],
            total_revenue: 0
          },
          {
            ride: @ride3,
            riders: [@visitor3],
            total_revenue: 6
          }
        ]
        }

      expect(@carnival.summary).to eq(expected)
    end
  end
end