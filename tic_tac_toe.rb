class Board
  attr_accessor :state
  def initialize
    @state = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    print_board
  end
  
  def print_board
    puts " #{@state[0]} | #{@state[1]} | #{@state[2]}"
    puts "―――|―――|―――"
    puts " #{@state[3]} | #{@state[4]} | #{@state[5]}"
    puts "―――|―――|―――"
    puts " #{@state[6]} | #{@state[7]} | #{@state[8]}"
    puts ''
  end

  def change_space(index, piece)
    @state[index] = piece
  end

  def winner?
    if @state.values_at(0, 1, 2).all?('X') || @state.values_at(0, 1, 2).all?('O')
      true
    elsif @state.values_at(3, 4, 5).all?('X') || @state.values_at(3, 4, 5).all?('O')
      true
    elsif @state.values_at(7, 8, 9).all?('X') || @state.values_at(7, 8, 9).all?('O')
      true
    elsif @state.values_at(0, 3, 6).all?('X') || @state.values_at(0, 3, 6).all?('O')
      true
    elsif @state.values_at(1, 4, 7).all?('X') || @state.values_at(1, 4, 7).all?('O')
      true
    elsif @state.values_at(2, 5, 8).all?('X') || @state.values_at(2, 5, 8).all?('O')
      true
    elsif @state.values_at(2, 4, 6).all?('X') || @state.values_at(2, 4, 6).all?('O')
      true
    elsif @state.values_at(0, 4, 8).all?('X') || @state.values_at(0, 4, 8).all?('O')
      true
    else
      false
    end
  end
end


class Player
  attr_reader :name
  attr_accessor :won
  def initialize(name, piece)
    @name = name
    @piece = piece
    @won = false
  end
  def declare_winner
  puts "#{self.name} wins!"
  self.won = true
  end
end


# GAME START
puts "Player one name?"
player1 = Player.new(gets.chomp, 'X')
puts "Player two name?"
player2 = Player.new(gets.chomp, 'O')
game = Board.new
until game.winner? do
  puts "#{player1.name}, Which space would you like?"
  choice = gets.chomp.to_i
  until (1..9).include?(game.state[choice - 1])
    puts "That space is taken, choose another"
    choice = gets.chomp.to_i
  end
  game.change_space(choice - 1, 'X')
  game.print_board 
  
  if game.winner?
    player1.declare_winner
    next
  end

  puts "#{player2.name}, Which space would you like?"
  choice = gets.chomp.to_i
  until (1..9).include?(game.state[choice - 1])
    puts "That space is taken, choose another"
    choice = gets.chomp.to_i
  end
  game.change_space(choice - 1, 'O')
  game.print_board

end

unless player1.won
  player2.declare_winner
end
