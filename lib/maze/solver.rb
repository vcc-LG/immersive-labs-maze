require 'pry'

module Maze
  class Solver
    attr_reader :file_name, :solution_node_array, :graph

    def initialize(file_name:)
      @file_name = file_name
      @maze = MazeFileParser.new.perform(@file_name)
      @graph = Graph.new(maze: @maze)
    end

    def perform
      visited = []
      node_queue = @graph.nodes
      until node_queue.empty?
        current_node = node_queue.sort_by!(&:distance).shift
        current_node.adjacent.reject { |n| visited.map.any? n }.each do |neighbour|
          next unless current_node.distance + 1 < neighbour.distance

          neighbour.through = current_node
        end
        visited << current_node
      end
      solution_as_str(visited)
    end

    private

    def solution_as_str(visited_list)
      return 'No solution found' if visited_list.detect { |v| v.maze_char == 'e' }.through.nil?

      path_list_direction_chars(sort_visited_list_from_end(visited_list))
    end

    def sort_visited_list_from_end(visited_list)
      result = []
      path_node = visited_list.detect { |v| v.maze_char == 'e' }
      until path_node.maze_char == 's'
        result << path_node
        path_node = path_node.through
      end
      result.reverse!
    end

    def path_list_direction_chars(path_list)
      path_list.map(&:direction).join(' ')
    end
  end
end
