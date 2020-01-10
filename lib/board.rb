require 'pry'

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(num)
    index = num.to_i - 1
    @cells[index]

  end

  def full?
    turn_count == 9
  end

  def turn_count
    @cells.select{|cell| cell == "X" || cell == "O"}.size
  end

  def taken?(num)
    index = num.to_i - 1
    @cells[index] == "X" || @cells[index] == "O"
  end

  def valid_move?(num)
    index = num.to_i - 1
    index >= 0 && index <= 8 && !taken?(num)
  end

  def update(num, player)
    index = num.to_i - 1
    @cells[index] = player.token
  end
end
