defmodule Day1Test do
  use ExUnit.Case

  @input_file_path "#{File.cwd!()}/test/support/input"

  test "counts the number of times readings increase from the last" do
    assert Day1.hello(@input_file_path) == 7
  end

  test "counts the number of times reading increase from last actual" do
    assert Day1.hello() == 7
  end
end
