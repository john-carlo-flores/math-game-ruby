require "./player"
require "./game"

player1 = Player.new("Player 1", "P1")
player2 = Player.new("Player 2", "P2")
game = Game.new(1, 20, player1, player2)

game.start_game