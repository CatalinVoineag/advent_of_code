# https://adventofcode.com/2022/day/4#part2

require "byebug"

class Main
  attr_reader :file
  private :file

  def initialize(file)
    @file = file
  end

  def run
    contained_pairs = 0
    items = []

    File.foreach(file) do |line|
      pairs = line.strip.split(',')

      first_pair = pairs.first.split('-')
      first_pair_range = (first_pair.first.to_i..first_pair.last.to_i)
      second_pair = pairs.last.split('-')
      second_pair_range = (second_pair.first.to_i..second_pair.last.to_i)

      if first_pair_range.include?(second_pair.first.to_i) || first_pair_range.include?(second_pair.last.to_i)
        contained_pairs += 1
      elsif second_pair_range.include?(first_pair.first.to_i) || second_pair_range.include?(first_pair.last.to_i)
        contained_pairs += 1
      end
    end

    puts contained_pairs
  end
end

Main.new("input.txt").run
#Main.new("test.txt").run
