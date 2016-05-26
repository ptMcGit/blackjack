class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add *new_cards
    @cards += new_cards
  end

  def value
    base = cards.map { |c| c.value }.reduce(:+)
    if cards.any? { |c| c.rank == :A } && base <= 11
      base + 10
    else
      base
    end
  end

  def blackjack?
    @cards.count == 2 && value == 21
  end

  def twenty_one?
    value == 21
  end
  
  def busted?
    value > 21
  end

  def to_s
    cards.map { |c| c.to_s }.join ", "
  end

  def showing
    @cards.first.to_s
  end

  def ties? competing_hand
    self.value == competing_hand.value
  end
  
  def beats? competing_hand
    #binding.pry
    case
    when self.value == competing_hand.value
      false
    when
      (self.value < 22) && (competing_hand.value > 22)
      true
    when
      (self.value < 22) && (self.value > competing_hand.value)
      true
    else
      false
    end
  end

#  def show_hand
  
end
