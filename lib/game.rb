require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      num_1 = combo[0]
      num_2 = combo[1]
      num_3 = combo[2]
      if board.cells[num_1] == "X" && board.cells[num_2] == "X" && board.cells[num_3] == "X"
        return combo
      elsif board.cells[num_1] == "O" && board.cells[num_2] == "O" && board.cells[num_3] == "O"
        return combo
      end
    end
    false
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    combo = won?
    return nil if !combo
    if board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X"
      return "X"
    elsif board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O"
      return "O"
    end
  end

  def turn
    input = current_player.move(board)
    count = 0
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      turn
    end
    return
  end

  def play
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    elsif !over?
      turn
    end
  end
end
