defmodule AOC2022.Day2Test do
  use ExUnit.Case

  alias AOC2022.Day2

  @input_dir "#{File.cwd!()}/test/day2/support"

  describe "Day2.part1 - scores rock/paper/scissors over multiple rounds" do
    test "sample input" do
      assert Day2.part1("#{@input_dir}/input_sample") == 15
    end

    test "full input" do
      assert Day2.part1("#{@input_dir}/input_full") == 14827
    end
  end

  describe "Day2.part2 - uses the proper decryption" do
    test "sample input" do
      assert Day2.part2("#{@input_dir}/input_sample") == 12
    end

    test "full input" do
      assert Day2.part2("#{@input_dir}/input_full") == 13889
    end
  end
end
