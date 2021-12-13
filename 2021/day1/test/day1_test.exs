defmodule Day1Test do
  use ExUnit.Case

  @input_dir "#{File.cwd!()}/test/support"

  describe "Day1.part1 - counts when readings increase" do
    test "sample input" do
      assert Day1.part1("#{@input_dir}/input_sample") == 7
    end

    test "full input" do
      assert Day1.part1("#{@input_dir}/input_full") == 1195
    end
  end

  describe "Day1.part2 - counts when a sliding window count increases" do
    test "sample input" do
      assert Day1.part2("#{@input_dir}/input_sample") == 5
    end

    test "full input" do
      assert Day1.part2("#{@input_dir}/input_full") == 1235
    end
  end
end
