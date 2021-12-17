defmodule Day3Test do
  use ExUnit.Case

  @input_dir "#{File.cwd!()}/test/day3/support"

  describe "Day3.part1" do
    test "sample input" do
      assert Day3.part1("#{@input_dir}/input_sample") == 198
    end

    test "full input" do
      assert Day3.part1("#{@input_dir}/input_full") == 3_277_364
    end
  end

  describe "Day3.part2" do
    test "sample input" do
      assert Day3.part2("#{@input_dir}/input_sample") == 230
    end

    test "full input" do
      assert Day3.part2("#{@input_dir}/input_full") == 5_736_383
    end
  end
end
