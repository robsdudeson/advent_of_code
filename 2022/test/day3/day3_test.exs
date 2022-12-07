defmodule AOC2022.Day3Test do
  use ExUnit.Case

  alias AOC2022.Day3

  @input_dir "#{File.cwd!()}/test/day3/support"

  describe "Day3.part1 - scores rock/paper/scissors over multiple rounds" do
    test "sample input" do
      assert Day3.part1("#{@input_dir}/input_sample") == 157
    end

    test "full input" do
      assert Day3.part1("#{@input_dir}/input_full") == 7811
    end
  end

  describe "Day3.part2 - uses the proper decryption" do
    test "sample input" do
      assert Day3.part2("#{@input_dir}/input_sample") == 70
    end

    test "full input" do
      assert Day3.part2("#{@input_dir}/input_full") == 2639
    end
  end
end
