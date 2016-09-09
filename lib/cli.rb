class Cli

  attr_accessor :game

  def initialize
  end

  def play_game
    self.game.play
  end

  def play_again?
    puts "Play another game? (y/n)"
    yn = gets.strip
    if yn == "y" || yn == "Y" || yn == "yes" || yn == "Yes" || yn == "YES" || yn == "YeS"
      puts "Do you want to change the settings?"
      yn = gets.strip
      if yn == "y" || yn == "Y" || yn == "yes" || yn == "Yes" || yn == "YES" || yn == "YeS"
        self.setup_game
      else
        self.game.board.reset!
      end
      return true
    else
      puts "Thanks for playing!"
      return false
    end
  end

  def setup_game
    puts "Will there be 0, 1 or 2 players?"
    num_players = gets.strip.to_i
    valid = false
    while !valid do
      if num_players == 0 || num_players == 2
        valid = true
      elsif num_players == 1
        puts "In a single player game, Player 1 will be human while Player 2 will be computer."
        valid = true
      else
        puts "Invalid selection!"
        puts "Please enter 0, 1 or 2."
        num_players = gets.chomp.to_i
      end
    end

    puts "Should Player 1 or Player 2 play X and go first?"
    first_player = gets.strip.to_i
    valid = false
    while !valid do
      if num_players == 0 && first_player == 1
        player_1 = Players::Computer.new("X")
        player_2 = Players::Computer.new("O")
        valid = true
      elsif num_players == 0 && first_player == 2
        player_2 = Players::Computer.new("X")
        player_1 = Players::Computer.new("O")
        valid = true
      elsif num_players == 1 && first_player == 1
        player_1 = Players::Human.new("X")
        player_2 = Players::Computer.new("O")
        valid = true
      elsif num_players == 1 && first_player == 2
        player_1 = Players::Human.new("O")
        player_2 = Players::Computer.new("X")
        valid = true
      elsif num_players == 2 && first_player == 1
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
        valid = true
      elsif num_players == 2 && first_player == 2
        player_1 = Players::Human.new("O")
        player_2 = Players::Human.new("X")
        valid = true
      else
        puts "Invalid selection!"
        puts "Please enter 1 or 2."
        first_player = gets.chomp.to_i
      end
    end
    self.game = Game.new(player_1, player_2)
  end
end