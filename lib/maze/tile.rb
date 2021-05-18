module Maze
  class Tile
    attr_reader :pos, :char

    def initialize(pos:, char:, traversable:)
      @pos = pos
      @char = char
      @traversable = traversable
    end

    def self.space(pos:, **args)
      new({pos: pos, traversable: true, char: " "}.merge(args))
    end

    def self.wall(pos:, **args)
      new({pos: pos, traversable: false, char: "#"}.merge(args))
    end

    def self.start(pos:, **args)
      new({pos: pos, traversable: true, char: "s"}.merge(args))
    end

    def self.end(pos:, **args)
      new({pos: pos, traversable: true, char: "e"}.merge(args))
    end

    def traversable?
      @traversable
    end

    def to_s
      "'#{char}' (#{pos.x},#{pos.y})"
    end

    def inspect
      to_s
    end
  end
end
