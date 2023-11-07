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
      round_conclusion = splitted_array.last.downcase.to_sym

      our_move = our_move(round_conclusion, opponent_move)

      contest_score = score(opponent_move, our_move)
      shape_score = point_rules[our_move].last

      scores << contest_score + shape_score
    end

    puts scores.sum
  end

  def score(opponent_move, our_move)
    return 3 if point_rules[opponent_move].first == point_rules[our_move].first

    win_rule = win_rules[opponent_move]
    if win_rule == our_move
      6
    else
      0
    end
  end

  def point_rules
    {
      a: [:rock, 1],
      b: [:paper, 2],
      c: [:scissors, 3]
    }
  end

  def win_rules
    {
      a: :b,
      b: :c,
      c: :a
    }
  end

  def our_move(round_conclusion, opponent_move)
    # X lose
    # Y draw
    # Z win
    if round_conclusion == :x
      win_rules.key(opponent_move)
    elsif round_conclusion == :y
      opponent_move
    else
      win_rules[opponent_move]
    end
  end
end

Main.new("input.txt").run
