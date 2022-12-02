defmodule AOC2022.Common do
  def read_input(file_path),
    do:
      file_path
      |> File.read!()
      |> String.trim()
      |> String.split("\n")
end
