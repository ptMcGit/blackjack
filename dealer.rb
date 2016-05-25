class Dealer

  attr_reader :deck

  def initialize
    @deck = Deck.new
  end

  def deal_hand_to player
#    binding.pry
    player.hand.cards.clear
    player.hand.cards.push(@deck.draw)
    player.hand.cards.push(@deck.draw)
  end

  def hit player
    player.hand.cards.push(@deck.draw)
  end
  
end
