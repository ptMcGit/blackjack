

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
