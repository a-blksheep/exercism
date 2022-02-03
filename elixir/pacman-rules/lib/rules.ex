defmodule Rules do
  @doc """
  Determines if Pac-Man is able to eat a ghost.

  ### Examples

    iex> Rules.eat_ghost?(false, true)
    false

  """
  def eat_ghost?(power_pellet_active, touching_ghost) do
    power_pellet_active and touching_ghost
  end

  @doc """
  Determines if Pac-Man has scored.

  ### Examples

    iex> Rules.score?(true, true)
    true

  """
  def score?(touching_power_pellet, touching_dot) do
    touching_power_pellet or touching_dot
  end

  @doc """
  determines if pac-man has lost.

  ### examples

    iex> Rules.lose?(false, true)
    true

  """
  def lose?(power_pellet_active, touching_ghost) do
    not power_pellet_active and touching_ghost
  end

  @doc """
  determines if pac-man has lost.

  ### examples

    iex> Rules.win?(false, true, false)
    false

  """
  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    has_eaten_all_dots and not lose?(power_pellet_active, touching_ghost)
  end
end
