module Maze
  class Solver
    attr_reader :file_name

    def initialize(file_name:)
      @file_name = file_name
    end

    def perform
      puts "This is Solver#perform. Complete me!"
      puts file_name
    end
  end
end
