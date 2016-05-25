class Dealer

  attr_reader :deck, :hand

  def initialize
    @deck = Deck.new
    @hand = Hand.new
  end

  def deal_hand_to player
    player.hand.cards.clear
    player.hand.cards.push(@deck.draw)
    player.hand.cards.push(@deck.draw)
  end

  def hit player
    if @deck.cards.count == 0
      @deck = Deck.new
    end
    player.hand.cards.push(@deck.draw)
  end

end
