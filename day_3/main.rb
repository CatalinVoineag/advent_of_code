# https://adventofcode.com/2022/day/3#part2

require "byebug"

ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a

class Main
  attr_reader :file
  private :file

  def initialize(file)
    @file = file
  end

  def run
    priority = 0
    items = []

    File.foreach(file) { |line| items << line.strip }

    items.each_slice(3) do |item_group|
      common_char = (item_group[0].chars & item_group[1].chars & item_group[2].chars).first

      priority += ALPHABET.find_index(common_char) + 1
    end

    puts priority
  end
end

Main.new("input.txt").run
