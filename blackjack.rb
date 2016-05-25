
class Blackjack
  # maybe we want subclasses?
end

class Card

  def initialize rank, suit
    @value = rank
    @suit = suit
    @to_s = rank.to_s + suit.to_s
  end

  attr_reader :suit, :to_s

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

class Hand

  def initialize
    @value = []
    @to_s = []
  end

  def add *card
    card.each do |x|
      @value.push x.value
      @to_s.push x.to_s
    end
  end

  def value
    count = 0

    0.upto @value.length do
      if [:K, :J, :Q].include? @value[count]
        @value[count] = 10
      end
      count += 1
    end

    @value.map! { |x| x.to_s }.sort
    @value.sort!

    count = 0

    final_value = 0

    0.upto @value.length do
      if @value[count] == "A"
        if final_value > 10
          final_value += 1
        else
          final_value += 11
        end
      else
        final_value += @value[count].to_i
      end
      count += 1
    end
    final_value
  end

  def  busted?
    value > 21
  end

  def blackjack?
    value == 21
  end

  def to_s
    @to_s.join(", ")
  end

end
