class Visitor
  attr_reader :name,
              :height,
              :preferences,
              :spending_money

  def initialize(name, height, initial_spending_money)
    @name = name
    @height = height
    @initial_spending_money = initial_spending_money
    @formatted_initial_spending_money = @initial_spending_money.delete("$").to_i
    @preferences = []
    @current_spending_money = @formatted_initial_spending_money
  end

  def spending_money
    @current_spending_money
  end

  def decrease_spending_money(ride_cost)
    @current_spending_money = @current_spending_money - ride_cost
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(minimum_height)
    @height >= minimum_height
  end
end

