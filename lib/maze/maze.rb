module Maze
  class Maze
    attr_reader :maze_start, :maze_end, :grid

    extend Forwardable
    def_delegators :@grid, :at, :width, :height

    def initialize(grid:, maze_start:, maze_end:)
      @grid = grid
      @maze_start = maze_start
      @maze_end = maze_end
    end

    def traversable?(pos)
      at(pos)&.traversable?
    end

    def finish?(pos)
      pos == maze_end
    end

    def adjacent(pos)
      rv = []

      rv << pos.up unless pos.y <= 0
      rv << pos.down unless pos.y >= height-1
      rv << pos.left unless pos.x <= 0
      rv << pos.right unless pos.x >= width-1

      rv.select {|p| traversable?(p) }
    end
  end
end
