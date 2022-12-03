defmodule AOC2022.Day2 do
  @moduledoc """
  Documentation for `AOC2022.Day2`.
  """

  import AOC2022.Common

  @doc """
  This strategy guide predicts and recommends the following:

  In the first round, your opponent will choose Rock (A), and you should choose Paper (Y). This ends in a win for you with a score of 8 (2 because you chose Paper + 6 because you won).
  In the second round, your opponent will choose Paper (B), and you should choose Rock (X). This ends in a loss for you with a score of 1 (1 + 0).
  The third round is a draw with both players choosing Scissors, giving you a score of 3 + 3 = 6.
  In this example, if you were to follow the strategy guide, you would get a total score of 15 (8 + 1 + 6).

  What would your total score be if everything goes exactly according to your strategy guide?

  Your puzzle answer was 14827.


  """
  def part1(file_path) do
    file_path
    |> read_input()
    |> play_rounds()
    |> Enum.sum()
  end

  defp play_rounds(_rounds, scores \\ [])

  defp play_rounds([], scores), do: scores

  defp play_rounds([round | rounds], scores) do
    [opponent, self] = String.split(round, " ")

    opponent = map_opponent(opponent)
    self = map_self(self)

    play_rounds(rounds, [map_play(self) + map_score(self, opponent)] ++ scores)
  end

  defp map_opponent("A"), do: :rock
  defp map_opponent("B"), do: :paper
  defp map_opponent("C"), do: :scissors

  defp map_self("X"), do: :rock
  defp map_self("Y"), do: :paper
  defp map_self("Z"), do: :scissors

  defp map_play(:rock), do: 1
  defp map_play(:paper), do: 2
  defp map_play(:scissors), do: 3

  # WIN
  defp map_score(:rock, :scissors), do: 6
  defp map_score(:scissors, :paper), do: 6
  defp map_score(:paper, :rock), do: 6

  # DRAW
  defp map_score(:rock, :rock), do: 3
  defp map_score(:scissors, :scissors), do: 3
  defp map_score(:paper, :paper), do: 3

  # LOSS
  defp map_score(_play1, _play2), do: 0

  @doc """
  The Elf finishes helping with the tent and sneaks back over to you. "Anyway, the second column says how the round needs to end: X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win. Good luck!"

  The total score is still calculated in the same way, but now you need to figure out what shape to choose so the round ends as indicated. The example above now goes like this:

  In the first round, your opponent will choose Rock (A), and you need the round to end in a draw (Y), so you also choose Rock. This gives you a score of 1 + 3 = 4.
  In the second round, your opponent will choose Paper (B), and you choose Rock so you lose (X) with a score of 1 + 0 = 1.
  In the third round, you will defeat your opponent's Scissors with Rock for a score of 1 + 6 = 7.
  Now that you're correctly decrypting the ultra top secret strategy guide, you would get a total score of 12.

  Following the Elf's instructions for the second column, what would your total score be if everything goes exactly according to your strategy guide?
  """
  def part2(file_path) do
    file_path
    |> read_input()
    |> play_rounds2()
    |> Enum.sum()
  end

  defp play_rounds2(_rounds, scores \\ [])

  defp play_rounds2([], scores), do: scores

  defp play_rounds2([round | rounds], scores) do
    [opponent, outcome] = String.split(round, " ")

    opponent = map_opponent(opponent)

    self =
      outcome
      |> map_desired_outcome()
      |> map_to_play(opponent)

    play_rounds2(rounds, [map_play(self) + map_score(self, opponent)] ++ scores)
  end

  defp map_desired_outcome("X"), do: :lose
  defp map_desired_outcome("Y"), do: :draw
  defp map_desired_outcome("Z"), do: :win

  defp map_to_play(:win, :rock), do: :paper
  defp map_to_play(:win, :paper), do: :scissors
  defp map_to_play(:win, :scissors), do: :rock

  defp map_to_play(:draw, play), do: play

  defp map_to_play(:lose, :rock), do: :scissors
  defp map_to_play(:lose, :scissors), do: :paper
  defp map_to_play(:lose, :paper), do: :rock
end
