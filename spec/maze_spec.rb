module Maze
  RSpec.describe Maze do
    let(:grid) do
      Grid.new(width: 2, height: 2).tap do |g|
        g.set(Tile.wall(pos: Pos.new(1,1)))
      end
    end
    subject { Maze.new(grid: grid, maze_start: Pos.new(0, 0), maze_end: Pos.new(1, 1)) }

    describe "#traversable?" do
      it "is true for traversable tiles" do
        expect(subject.traversable?(Pos.new(0, 0))).to be
      end

      it "is false for non traversable tiles" do
        expect(subject.traversable?(Pos.new(1, 1))).to_not be
      end
    end

    describe "#finish?" do
      it "is true for the finishing tile" do
        expect(subject.finish?(Pos.new(1, 1))).to be
      end

      it "is false for non finishing tiles" do
        expect(subject.finish?(Pos.new(0, 0))).to_not be
      end
    end
  end
end
