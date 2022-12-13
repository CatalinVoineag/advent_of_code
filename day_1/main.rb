require "byebug"

class Main

  def run
    array = []
    File.foreach("input.txt") do |line|
      array << line.to_i
    end

    puts array.slice_before(0).map(&:sum).max
  end
end

Main.new.run
