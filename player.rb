class Player

  attr_reader :wallet, :hand, :wager, :hand_over

  def initialize starting_cash=0
    @wallet = starting_cash
    @hand = Hand.new
    @menu = {
      "h" => "Hit Me",
      "s" => "Stand",
    }
    @hand_over = false
    @won = false
    @wager = 0
  end

  def wins amount
    @won = true
    @wallet += amount
  end

  def broke?
    @wallet == 0
  end

  def player_menu
    #@menu
    @menu.each do |key, value| print "(" + key + ") " + value + " " end
    print "\n"
  end

  def decision
    player_menu
    puts "What would you like to do?"
    gets.chomp
  end

  def stand
    @hand_over = true
  end

  def bust
    you_lost
    @hand_over = true
    @won = false
  end

    
  
end
