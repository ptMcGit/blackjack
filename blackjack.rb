# Blackjack game

require "pry"

require './card'
require './deck'
require './hand'
require './player'
require './dealer'

def you_lost
  # a function for losers
  puts "You lost!"
  exit
end


def you_win
  puts "Great job! You win!"
end

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

  # take bets

  # Round 1 - deal one card to each player

  [g.player, g.dealer].each do |current_player|
    g.dealer.hit current_player
  end

  # Round 2 - deal one card to each player

  [g.player, g.dealer].each do |current_player|
    g.dealer.hit current_player
    current_player.hand.blackjack? && current_player.stand
  end

  # play out each hand

  [g.player].each do |current_player|

    # play to 21 or bust for each player including dealer

    until current_player.hand_over
      if current_player.hand.busted?
        current_player.bust
        break
      elsif current_player.hand.twenty_one?
        current_player.stand
        break
      end

      puts "Dealer: #{g.dealer.hand.showing}"
      puts "Player: #{g.player.hand.to_s}; Value: #{g.player.hand.value}"

      decision = current_player.decision
      case  decision
      when "h"
          #      binding.pry
        g.dealer.hit current_player
      when "s"
        current_player.stand
      end
    end
    #binding.pry
    puts "Dealer: #{g.dealer.hand.to_s}; Value: #{g.dealer.hand.value}"
    puts "Player: #{g.player.hand.to_s}; Value: #{g.player.hand.value}"

    [g.player].each do |current_player|

      if current_player.hand.beats? g.dealer.hand
        you_win
      elsif current_player.hand.ties? g.dealer.hand
        puts "You tied!"
      else
        you_lost
      end
    end



  # is dealer holding a 10 value card or Ace, he may look at the other card
  # if player holds blackjack and not dealer, they are paid out bet * 1.5
  # if the dealer holds blackjack, collect from all players who do not hold blackjacks
  # if player and dealer hold blackjack, player keeps chips

  # SPLITTING (dealer can't): if a player holds two cards of same denomination, they may split it into two hands each with the original wager
  # the car; if the player gets two aces, they may only draw one additional card

  # DOUBLING-DOWN (dealer can't): when two original cards total 9, 10, or 11 the player may place an additional bet equal to the original

  # deal out players who stand, are hit and stand, or go bust

  ## DEALER'S PLAY
  # if total is 16 or under, dealer must get a card until 17 (must stand on Aces that are counted as 11 and bring total to 17)



  #

  #binding.pry
  end
end
exit

#binding.pry
