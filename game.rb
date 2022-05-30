require "./question"

class Game
  def initialize(min, max, player1, player2)
    @numbers = (min..max).to_a
    @question = Question.new
    @players = [player1, player2]
  end if 
  
  def start_game()
    current_player = @players[0]
    
    while(!game_end)
      puts "\n----- NEW TURN -----"
      result = question_player(current_player)
      update_state(current_player, result)
      game_status
      current_player = next_player(current_player)
    end

    puts "Good bye!"
  end
  
  private

  def next_player(player)
    playerIndex = @players.index player
    @players[playerIndex == 1 ? 0 : 1]
  end

  def question_player(player)
    q = @question.setup_question(@numbers)

    puts "#{player.name}: #{q[:question]}"
    answer = gets.chomp.to_f
    answer == q[:answer]
  end

  def update_state(player, result) 
    if result
      return puts "#{player.name}: YES! You are correct."
    end

    puts "#{player.name}: Seriously? No!"
    player.reduce_life(1)
  end

  def game_status()
    puts "#{@players[0].tag}: #{@players[0].life} vs #{@players[1].tag}: #{@players[1].life}"
  end

  def game_end
    player1_status = @players[0].dead
    player2_status = @players[1].dead

    # If either player is dead, declare the other winner
    if (player1_status || player2_status)
      winner = player1_status ? 1 : 0
      puts "\n#{@players[winner].name} wins with a score of #{@players[winner].life}"
      puts "----- GAME OVER -----"
      return true
    end
  end 
end