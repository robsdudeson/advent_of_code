defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """

  def part1(file_path) do
    file_path
    |> get_readings()
    |> count_greater_than()
  end

  defp get_readings(file_path),
    do:
      file_path
      |> File.read!()
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(fn reading ->
        {reading_int, _} = Integer.parse(reading)
        reading_int
      end)

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

  def part2(file_path) do
    file_path
    |> get_readings()
    |> sliding_window()
  end

  defp sliding_window(readings, previous_sum \\ nil, count \\ 0)

  defp sliding_window([], _previous_sum, count), do: count

  defp sliding_window([a, b, c | tail], previous_sum, count) do
    new_sum = a + b + c
    count = if previous_sum && new_sum > previous_sum, do: count + 1, else: count
    sliding_window([b, c] ++ tail, new_sum, count)
  end

  defp sliding_window(_, _, count), do: count
end
