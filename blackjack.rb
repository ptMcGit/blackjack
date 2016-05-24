

class Blackjack
  # maybe we want subclasses?
end

class Card

  def initialize rank, symbol
    @value = rank
    @symbol = symbol
  end

  def value
    if [:K, :Q, :J].include? @value
      return 10
    else
      return @value
    end
  end

end

class Deck
  def initialize
    @cards = (1..52).to_a
    @drawn = []
  end

  attr_reader :cards

  def draw
    @drawn.push @cards.pop
    @drawn.last
  end

  def drawn
    @drawn
  end
end
