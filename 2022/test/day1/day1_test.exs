defmodule AOC2022.Day1Test do
  use ExUnit.Case

  alias AOC2022.Day1

  @input_dir "#{File.cwd!()}/test/day1/support"

  describe "Day1.part1 - find elf with max count" do
    test "sample input" do
      assert Day1.part1("#{@input_dir}/input_sample") == 24000
    end

    test "full input" do
      assert Day1.part1("#{@input_dir}/input_full") == 74711
    end
  end

  describe "Day1.part2 - count top three counts" do
    test "sample input" do
      assert Day1.part2("#{@input_dir}/input_sample") == 45000
    end

    test "full input" do
      assert Day1.part2("#{@input_dir}/input_full") == 209481
    end
  end
end
