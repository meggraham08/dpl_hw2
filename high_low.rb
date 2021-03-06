require_relative 'Deck'

class HighLow

  def initialize(player)
    @player = player
    @deck = Deck.new
    play
  end

  def play
    puts "How much do you want to wager?"
    wager = gets.strip.to_i
    if wager > 0 && wager <= @player.wallet
      first_card = @deck.pull_card
      second_card = @deck.pull_card
      puts "The card is #{first_card}"
      print "(higher/lower): "
      guess = gets.strip.downcase
      puts "The second card is #{second_card}"
      if guess == 'higher' 
        if is_correct = first_card.hl_to_i <= second_card.hl_to_i
          puts "You won!"
        else
          puts "You lost, would you like to play again?"
        end
        wager *= -1 if !is_correct
        @player.wallet += wager 
      else
        if is_correct = first_card.hl_to_i > second_card.hl_to_i
          puts "You won!"
        else
          puts "You lost, would you like to play again?"
        end
        wager *= -1 if !is_correct
        @player.wallet += wager 
      end
    else
      puts "go home"
      return
    end
  end


  def playAgain
    puts "Would you like to play again? (y/n)?"
    play_again = gets.strip.to_s
    if play_again == 'y'
      play
    else
      main_menu
    end
  end
end