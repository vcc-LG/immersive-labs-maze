module Maze
  RSpec.describe Solver do
    describe '#solve' do
      it 'returns the expected solution for maze 1' do
        solver = Solver.new(file_name: SpecHelpers.fixture_fpath('1.maze'))
        expect(solver.perform).to eq('R R')
      end

      it 'returns the expected solution for maze 2' do
        solver = Solver.new(file_name: SpecHelpers.fixture_fpath('2.maze'))
        expect(solver.perform).to eq('D D D L L D D L L L L D')
      end

      it 'returns the expected solution for maze 3' do
        solver = Solver.new(file_name: SpecHelpers.fixture_fpath('3.maze'))
        expect(solver.perform).to eq('R R R R R R R R R R U U L L U U R R U U L L L L L U U U U U U R R R R R U U L L U U R R U U U U U U U U R R R U U R R R R R R U R U R R R R R R R R R R R R R R R R R R R R R R R R R R R R R R R R R R R R R R R R R D D L L L L L D D R R D D R R R D D L L L L L L L L U U L L L L L L U U U U L L L L L L L L L L L L D D R R D D D D R R R U U R R R D D R R R D D D D R R R D D D D D D D D R R R R R R D D D D D D R R R R R R D D L L L D')
      end
    end
  end
end
