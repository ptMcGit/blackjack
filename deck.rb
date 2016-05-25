class Deck
  SUITS = [:S, :D, :H, :C]
  RANKS = 2.upto(10).to_a + [:J, :Q, :K, :A]

  attr_reader :cards, :drawn

  def initialize
    @cards, @drawn = [], []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards.push Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end

  def reshuffle
    @cards.push(*@drawn).shuffle!
    @drawn = []
  end

  def draw
    card = @cards.pop
    @drawn.push card
    card
  end
end
