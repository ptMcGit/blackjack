class Player

  attr_reader :wallet, :hand

  def initialize starting_cash=0
    @wallet = starting_cash
    @hand = Hand.new
  end

  def wins amount
    @wallet += amount
  end

  def broke?
    @wallet == 0
  end

end
