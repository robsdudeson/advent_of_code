defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """

  @default_file_path "#{File.cwd!()}/support/input"

  @doc """
  Hello world.

  ## Examples

      iex> Day1.hello()
      :world

  """
  def hello(file_path \\ @default_file_path) do
      file_path
      |> File.read!()
      |> String.trim()
      |> String.split("\n")
      |> count_greater_than(nil)
      |> IO.inspect()
  end

  defp count_greater_than(readings, last, count \\ 0)

  defp count_greater_than([], _last, count), do: count

  defp count_greater_than(readings, nil, count) when length(readings) > 1 do
    [last | tail] = readings
    count_greater_than(tail, last, count)
  end

  defp count_greater_than([current | tail], last, count) do

    count = if current > last, do: count + 1, else: count

    IO.inspect("#{current}, #{last}, #{count}")

    count_greater_than(tail, current, count)
  end
end
