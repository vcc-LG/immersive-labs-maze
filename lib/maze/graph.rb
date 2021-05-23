module Maze
  class Graph
    attr_reader :nodes
    attr_writer :maze

    def initialize(maze:)
      @maze = maze
      @nodes = nodes_in_maze
      assign_node_neighbours
    end

    private

    def nodes_in_maze
      queue = []
      @maze.grid.valid_pos_array.each do |tile|
        distance = tile.char == 's' ? 0 : 1 << 64
        queue << Node.new(pos: tile.pos, maze_char: tile.char, distance: distance)
      end
      queue
    end

    def assign_node_neighbours
      @nodes.each do |node|
        adjacent_tiles = @maze.adjacent(node.pos)
        adjacent_tiles.each do |tile|
          neighbour = @nodes.detect { |n| n.pos == tile }
          node.adjacent << neighbour
        end
      end
    end
  end
end
