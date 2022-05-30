require "./question"

class Game
  def initialize(min, max, player1, player2)
    @numbers = [min...max]
    @question = Question.new
    @players = [player1, player2]
  end if 
  
  def start_game()
    current_player = 0
    
    while(!game_end)
      puts "----- NEW TURN -----"
      result = question_player(@players[current_player])
      update_state(player, result)
      game_status
      current_player = next_player(current_player)
    end

    puts "Good bye!"
  end
  
  private

  def next_player(player)
    player == 1 ? 0 : 1
  end

  def question_player(player)
    q = @question.setup_question(@numbers)

    puts "#{player.name}: #{q[:question]}"
    answer = gets.chomp
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
    puts "#{@players[0]}: #{@players[0].life} vs #{@players[1]}: #{@players[1].life}"
  end

  def game_end
    player1_status = @players[0].dead
    player2_status = @players[1].dead

    # If either player is dead, declare the other winner
    if (player1_status || player2_status)
      winner = player1_status ? 1 : 0
      puts "#{@players[winner]} wins with a score of #{@players[winner].life}"
      puts "----- GAME OVER -----"
    end
  end 
end