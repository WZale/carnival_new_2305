class Visitor
  attr_reader :name,
              :height,
              :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @raw_spending_money = spending_money
    @preferences = []
  end

  def spending_money
    @raw_spending_money.delete("$").to_i
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(minimum_height)
    @height >= minimum_height
  end
end

