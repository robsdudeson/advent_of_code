defmodule AOC2022.Day3 do
  @moduledoc """
  Documentation for `AOC2022.Day3`.
  """

  import AOC2022.Common

  def part1(file_path) do
    file_path
    |> read_input()
    |> Enum.reduce([], fn ruck, acc ->
      middle = (String.length(ruck) / 2) |> floor()
      {item1, item2} = String.split_at(ruck, middle)

      priority =
        item1
        |> String.myers_difference(item2)
        |> List.keyfind!(:eq, 0)
        |> map_priority()

      [priority] ++ acc
    end)
    |> Enum.sum()
  end

  defp map_priority({_, item_type}) do
    {_key, priority} =
      (Enum.to_list(?a..?z) ++ Enum.to_list(?A..?Z))
      |> Enum.map(fn c -> <<c::utf8>> end)
      |> Enum.with_index(1)
      |> Enum.find(fn {key, _value} -> key == String.at(item_type, 0) end)

    priority
  end

  def part2(file_path) do
    file_path
      |> read_input()
      |> calc_groups(0)
  end

  defp calc_groups([], sum), do: sum

  defp calc_groups([elf1, elf2, elf3 | groups], sum) do
    common =
      elf1
      |> String.codepoints()
      |> Enum.reduce("", fn char, acc ->
        if String.contains?(elf2, char) && String.contains?(elf3, char) do
          "#{char}#{acc}"
        else
          acc
        end
      end)

    calc_groups(groups, map_priority({nil, common}) + sum)
  end
end
