class Carnival
  attr_reader :name,
              :duration,
              :rides

  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    @rides.max_by do |ride|
      ride.rider_log.length
    end
  end

  def most_profitable_ride
    @rides.max_by do |ride|
      ride.total_revenue
    end
  end

  def total_revenue
    @rides.sum do |ride|
      ride.total_revenue
    end
  end

  def summary
    carnival_summary = Hash.new {|h, k| h[k] = []}
    carnival_summary[:visitor_count] = @rides.sum { |ride| ride.rider_log.count }
    # carnival_summary[:revenue_earned] = total_revenue
    carnival_summary[:visitors] = visitor_info

  end
  
  # helper method
  def visitor_info
    visitors_hash = Hash.new {|h, k| h[k] = []}
    @rides.each do |ride|
      @rides.flat_map { |ride| ride.rider_log.uniq }.flatten
      require 'pry'; binding.pry

    end
  end
end