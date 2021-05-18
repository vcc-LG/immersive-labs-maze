module Maze
  RSpec.describe Grid do
    let(:tile) { Tile.wall(pos: Pos.new(1,1)) }
    subject do
      Grid.new(width: 5, height: 5).tap { |g| g.set(tile) }
    end

    describe "#at" do
      it "finds the object" do
        expect(subject.at(Pos.new(1, 1))).to eq(tile)
      end
    end

    describe "#set" do
      it "adds the object" do
        expect(subject.at(Pos.new(1, 1))).to eq(tile)
      end
    end

    describe "#find" do
      it "returns the first matching tile found" do
        expect(subject.find("#")).to eq tile
      end
    end
  end
end
