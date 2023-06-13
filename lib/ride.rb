class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log

  def initialize(ride_data)
    @name = ride_data[:name]
    @min_height = ride_data[:min_height]
    @admission_fee = ride_data[:admission_fee]
    @excitement = ride_data[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end

  def board_rider(rider)
    return false if !rider.preferences.include?(@excitement) || !rider.tall_enough?(@min_height)
    rider.decrease_spending_money(@admission_fee)
    if @rider_log[rider].nil?
      @rider_log[rider] = 1
    else
      @rider_log[rider] += 1
    end
    @total_revenue += @admission_fee
  end
end