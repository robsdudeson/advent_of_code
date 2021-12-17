defmodule Day3 do
  @moduledoc """
  Documentation for `Day3`.
  """

  import Common

  def part1(file_path) do
    file_path
    |> read_input()
    |> Enum.map(&String.graphemes/1)
    |> transpose()
    |> Enum.map(&count_bit/1)
    |> determine_commonality()
    |> Enum.reduce(1, fn s, acc ->
      {number, _} = Integer.parse(s, 2)
      acc * number
    end)
  end

  def part2(file_path) do
    input_lines = read_input(file_path)

    {o2_reading, _} =
      input_lines
      |> determine_oxygen()
      |> Integer.parse(2)

    {co2_reading, _} =
      input_lines
      |> determine_carbon()
      |> Integer.parse(2)

    co2_reading * o2_reading
  end

  defp transpose([[] | _]), do: []

  defp transpose(m) do
    [Enum.map(m, &hd/1) | transpose(Enum.map(m, &tl/1))]
  end

  defp count_bit(bits, counts \\ {0, 0})
  defp count_bit([], counts), do: counts

  defp count_bit(["0" | tail], {zeros, ones}) do
    count_bit(tail, {zeros + 1, ones})
  end

  defp count_bit(["1" | tail], {zeros, ones}) do
    count_bit(tail, {zeros, ones + 1})
  end

  defp determine_commonality(count_tuples, commonalites \\ ["", ""])

  defp determine_commonality([], commonalites), do: commonalites

  defp determine_commonality([{zeros, ones} | tail], [most_common, least_common]) do
    new_commonalities =
      case zeros > ones do
        true -> ["#{most_common}0", "#{least_common}1"]
        _ -> ["#{most_common}1", "#{least_common}0"]
      end

    determine_commonality(tail, new_commonalities)
  end

  defp determine_oxygen(lines, position \\ 0)

  defp determine_oxygen([one], _), do: one

  defp determine_oxygen(lines, position) do
    [most_common, _] =
      lines
      |> Enum.map(&String.graphemes/1)
      |> transpose()
      |> Enum.map(&count_bit/1)
      |> determine_commonality()

    Enum.reduce(lines, [], fn line, acc ->
      if String.at(line, position) == String.at(most_common, position) do
        acc ++ [line]
      else
        acc
      end
    end)
    |> determine_oxygen(position + 1)
  end

  defp determine_carbon(lines, position \\ 0)

  defp determine_carbon([one], _), do: one

  defp determine_carbon(lines, position) do
    [_, least_common] =
      lines
      |> Enum.map(&String.graphemes/1)
      |> transpose()
      |> Enum.map(&count_bit/1)
      |> determine_commonality()

    Enum.reduce(lines, [], fn line, acc ->
      if String.at(line, position) == String.at(least_common, position) do
        acc ++ [line]
      else
        acc
      end
    end)
    |> determine_carbon(position + 1)
  end
end
