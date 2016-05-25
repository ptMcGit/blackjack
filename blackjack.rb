# Blackjack game

require "pry"

require './card'
require './deck'
require './hand'
require './player'
require './dealer'

class Blackjack
  attr_reader :dealer, :player

  def initialize
    @dealer = Dealer.new
    @player = Player.new
  end

end

game_over = false

g = Blackjack.new
until game_over
  # deal the cards
  g.dealer.deal_hand_to g.dealer
  g.dealer.deal_hand_to g.player
  #

  binding.pry
end


binding.pry

