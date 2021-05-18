module Maze
  RSpec.describe MazeFileParser do
    describe "#perform" do
      it "returns the maze as expected" do
        maze = described_class.new.perform(SpecHelpers.fixture_fpath("1.maze"))
        expect(maze.grid.to_s).to eq(
          "###\n" +
          "s e\n" +
          "###"
        )
      end
    end
  end
end
