defmodule AOC2022.Day1 do
  @moduledoc """
  Documentation for `AOC2022.Day1`.
  """

  import AOC2022.Common

  @doc """
  This list represents the Calories of the food carried by five Elves:

  The first Elf is carrying food with 1000, 2000, and 3000 Calories, a total of 6000 Calories.
  The second Elf is carrying one food item with 4000 Calories.
  The third Elf is carrying food with 5000 and 6000 Calories, a total of 11000 Calories.
  The fourth Elf is carrying food with 7000, 8000, and 9000 Calories, a total of 24000 Calories.
  The fifth Elf is carrying one food item with 10000 Calories.
  In case the Elves get hungry and need extra snacks, they need to know which Elf to ask: they'd like to know how many Calories are being carried by the Elf carrying the most Calories. In the example above, this is 24000 (carried by the fourth Elf).

  Find the Elf carrying the most Calories. How many total Calories is that Elf carrying?

  Your puzzle answer was 74711.
  """
  def part1(file_path) do
    file_path
    |> read_input()
    |> Enum.map(&map_input/1)
    |> parse_elves([])
    |> Enum.max()
  end

  defp map_input(""), do: nil
  defp map_input(integer), do: String.to_integer(integer)

  defp parse_elves([], elves), do: elves

  defp parse_elves([nil | counts], elves) do
    parse_elves(counts, [0] ++ elves)
  end

  defp parse_elves([count | counts], [elf | elves]) do
    parse_elves(counts, [elf + count] ++ elves)
  end

  defp parse_elves([count | counts], []) do
    parse_elves(counts, [count])
  end

  @doc """
  By the time you calculate the answer to the Elves' question, they've already realized that the Elf carrying the most Calories of food might eventually run out of snacks.

  To avoid this unacceptable situation, the Elves would instead like to know the total Calories carried by the top three Elves carrying the most Calories. That way, even if one of those Elves runs out of snacks, they still have two backups.

  In the example above, the top three Elves are the fourth Elf (with 24000 Calories), then the third Elf (with 11000 Calories), then the fifth Elf (with 10000 Calories). The sum of the Calories carried by these three elves is 45000.

  Find the top three Elves carrying the most Calories. How many Calories are those Elves carrying in total?
  """
  def part2(file_path) do
    file_path
    |> read_input()
    |> Enum.map(&map_input/1)
    |> parse_elves([])
    |> Enum.sort(&(&1 >= &2))
    |> top_three_sum()
  end

  defp top_three_sum([e1, e2, e3 | _elves]), do: e1 + e2 + e3
end
