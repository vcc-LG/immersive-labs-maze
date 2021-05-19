require 'pry'

module Maze
  class Solver
    attr_reader :file_name, :solution_node_array

    def initialize(file_name:)
      @file_name = file_name
      @maze = MazeFileParser.new.perform(@file_name)
      @solution_node_array = []
    end

    def perform
      # Create a grid of equal size to the maze to hold distance values.
      # Set each to infinity until we've calculated its distance from 's'
      distance_grid = Array.new(@maze.grid.height, 1 << 64) { Array.new(@maze.grid.width, 1 << 64) }

      visited = []
      queue = []

      maze_start = @maze.grid.find('s').pos
      maze_end = @maze.grid.find('e').pos

      # The starting position has distance 0
      distance_grid[maze_start.y][maze_start.x] = 0
      # Add the starting tile as a node to the unvisited tile queue
      queue << Node.new(distance: distance_grid[maze_start.y][maze_start.x], pos: maze_start)

      # Keep looping through unvisited tiles until we've reached the maze end
      # or we've visited every available node
      until queue.empty?
        # The tile we pick is an unvisited tile with the next
        # shortest distance from the start
        current_tile = queue.sort_by!(&:distance).shift

        distance_from_current = current_tile.distance + 1
        neighbours = @maze.adjacent(current_tile.pos)
        neighbours.each do |n|
          next if visited.any? { |v| v.pos == n }

          # Update neighbour if new calculated distance is shorter than its
          # current distance value
          next unless distance_from_current < distance_grid[n.y][n.x]

          distance_grid[n.y][n.x] = distance_from_current
          # Find out which direction this neighbouring tile is
          # from our current position
          if n == current_tile.pos.left
            direction = 'L'
          elsif n == current_tile.pos.right
            direction = 'R'
          elsif n == current_tile.pos.up
            direction = 'U'
          elsif n == current_tile.pos.down
            direction = 'D'
          end
          # Remove old node data in queue and replace with updated
          queue.reject { |v| v.pos == n }
          queue << Node.new(distance: distance_grid[n.y][n.x], pos: n, through: current_tile, direction: direction)
        end
        # Once we've calculated all neighbouring tile distances
        # we can mark the current tile as 'visited'
        visited << current_tile

      end

      # Generate list of nodes along solution path
      # from start to end by walking back through
      # connected tiles from end tile
      @solution_node_array = []
      node_on_path = visited.find { |v| v.pos == maze_end }

      # If the end tile was never reached then the algorithm
      # wasn't able to find a path from the start
      return 'No solution found' if node_on_path.nil?

      while node_on_path.pos != maze_start
        @solution_node_array << node_on_path
        node_on_path = node_on_path.through
      end

      @solution_node_array.reverse!

      # Return string representing direction choices
      @solution_node_array.map(&:direction).join(' ')
    end
  end

  class Node
    attr_reader :pos, :distance, :through, :direction

    def initialize(pos:, distance:, through: nil, direction: nil)
      @pos = pos
      @distance = distance
      @through = through
      @direction = direction
    end
  end
end
