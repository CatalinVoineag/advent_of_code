require "byebug"

class Main
  attr_reader :file
  private :file

  def initialize(file)
    @file = file
  end

  def run
    scores = []

    File.foreach(file) do |line|
      splitted_array = line.split(" ")
      opponent_move = splitted_array.first.downcase.to_sym
      our_move = splitted_array.last.downcase.to_sym

      contest_score = score(opponent_move, our_move)
      shape_score = rules[our_move].last

      scores << contest_score + shape_score
    end

    puts scores.sum
  end

  def score(opponent_move, our_move)
    return 3 if rules[opponent_move].first == rules[our_move].first

    win_rule = win_rules[opponent_move]
    if win_rule == our_move
      6
    else
      0
    end
  end

  def rules
    {
      a: [:rock, 1],
      b: [:paper, 2],
      c: [:scissors, 3],
      x: [:rock, 1],
      y: [:paper, 2],
      z: [:scissors, 3],
    }
  end

  def win_rules
    {
      a: :z,
      b: :x,
      c: :y
    }
  end
end

Main.new("input.txt").run
