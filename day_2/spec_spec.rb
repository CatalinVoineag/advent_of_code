require_relative "main"

RSpec.describe Main do
  describe "run" do
    it "returns expected response" do
      main = Main.new("test.txt")

      expect{ main.run }.to output("12\n").to_stdout
    end
  end
end
