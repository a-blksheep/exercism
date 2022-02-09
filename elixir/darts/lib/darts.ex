defmodule Darts do
  @type position :: {number, number}

  @inner_radius 1
  @middle_radius 5
  @outer_radius 10

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({_x, _y} = position) do
    cond do
      inside?(position, @inner_radius) -> 10
      inside?(position, @middle_radius) -> 5
      inside?(position, @outer_radius) -> 1
      true -> 0
    end
  end

  @doc false
  @spec inside?(position :: position, rad :: number) :: boolean
  defp inside?({x, y}, rad) when x * x + y * y <= rad * rad, do: true
  defp inside?(_, _), do: false
end
