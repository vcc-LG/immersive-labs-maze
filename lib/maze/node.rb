module Maze
  class Node
    attr_reader :through
    attr_accessor :pos, :distance, :adjacent, :maze_char

    def initialize(pos:, maze_char:, distance:)
      @pos = pos
      @maze_char = maze_char
      @through = nil
      @direction = nil
      @distance = distance
      @adjacent = []
    end

    def through=(node)
      @through = node
      @distance = @through.distance + 1
    end

    def direction
      direction_char
    end

    private

    def direction_char
      if @pos == @through.pos.left
        'L'
      elsif @pos == @through.pos.right
        'R'
      elsif @pos == @through.pos.up
        'U'
      elsif @pos == @through.pos.down
        'D'
      end
    end
  end
end
