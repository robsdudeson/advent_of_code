defmodule Day2 do
  @moduledoc """
  Documentation for `Day2`.
  """

  def part1(file_path) do
    file_path
    |> read_input()
    |> process_moves()
    |> calculate_product()
  end

  def part2(file_path) do
    file_path
    |> read_input()
    |> process_moves_2()
    |> calculate_product()
  end

  defp read_input(file_path),
    do:
      file_path
      |> File.read!()
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(fn line ->
        [direction, count] = String.split(line, " ")
        {count_int, _} = Integer.parse(count)
        {direction, count_int}
      end)

  defp calculate_product({x, y}), do: x * y

  defp process_moves(moves, position \\ {0, 0})

  defp process_moves([], position), do: position

  defp process_moves([{"forward", count} | tail], {x, y}), do: process_moves(tail, {x + count, y})

  defp process_moves([{"up", count} | tail], {x, y}), do: process_moves(tail, {x, y - count})

  defp process_moves([{"down", count} | tail], {x, y}), do: process_moves(tail, {x, y + count})

  defp process_moves_2(moves, aim \\ 0, position \\ {0, 0})

  defp process_moves_2([], _aim, position), do: position

  defp process_moves_2([{"forward", count} | tail], aim, {x, y}),
    do: process_moves_2(tail, aim, {x + count, aim * count + y})

  defp process_moves_2([{"up", count} | tail], aim, position),
    do: process_moves_2(tail, aim - count, position)

  defp process_moves_2([{"down", count} | tail], aim, position),
    do: process_moves_2(tail, aim + count, position)
end
