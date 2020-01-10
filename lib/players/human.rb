require_relative "../player.rb"
module Players
  class Human < Player
    def move(board)
      puts "Play this game my brother:"
      gets.strip
    end
  end

end
