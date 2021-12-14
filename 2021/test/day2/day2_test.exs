defmodule Day1Test do
  use ExUnit.Case

  @input_dir "#{File.cwd!()}/test/day2/support"

  describe "Day2.part1" do
    test "sample input" do
      assert Day2.part1("#{@input_dir}/input_sample") == 150
    end

    test "full input" do
      assert Day2.part1("#{@input_dir}/input_full") == 2_036_120
    end
  end

  describe "Day2.part2" do
    test "sample input" do
      assert Day2.part2("#{@input_dir}/input_sample") == 900
    end

    test "full input" do
      assert Day2.part2("#{@input_dir}/input_full") == 900
    end
  end
end
