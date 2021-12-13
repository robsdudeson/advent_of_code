defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """

  def part1(file_path) do
    file_path
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn reading -> Integer.parse(reading) end)
    |> count_greater_than()
  end

  defp count_greater_than(readings, previous \\ nil, count \\ 0)

  defp count_greater_than([], _previous, count), do: count

  defp count_greater_than(readings, nil, count) when length(readings) > 1 do
    [first | tail] = readings
    count_greater_than(tail, first, count)
  end

  defp count_greater_than([current | tail], previous, count) do
    new_count = if current > previous, do: count + 1, else: count

    count_greater_than(tail, current, new_count)
  end
end
