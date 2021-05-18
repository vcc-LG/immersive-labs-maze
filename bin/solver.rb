#!/usr/bin/env ruby

require_relative "../lib/maze"

solution = Maze::Solver.new(
  file_name: ARGV[0]
).perform

puts solution
