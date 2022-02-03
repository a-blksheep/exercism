defmodule Lasagna do
  @expected_minutes_in_oven 40
  @prep_time_per_layer 2

  @doc """
  The expected number of minutes spent in the oven.

  ### Examples

    iex> Lasagna.expected_minutes_in_oven()
    40

  """
  def expected_minutes_in_oven(), do: @expected_minutes_in_oven

  @doc """
  The remaining minutes in the oven.

  ### Examples

    iex> Lasagna.remaining_minutes_in_oven(25)
    15

  """
  def remaining_minutes_in_oven(minutes) do
    @expected_minutes_in_oven - minutes
  end

  @doc """
  The preparation time, assuming 2 minutes per layer.

  ### Examples

    iex> Lasagna.preparation_time_in_minutes(2)
    4

  """
  def preparation_time_in_minutes(layers) do
    @prep_time_per_layer * layers
  end

  @doc """
  Return how many minutes in total you've worked on cooking the lasagna,
  which is the sum of the preparation time in minutes, and the time in
  minutes the lasagna has spent in the oven at the moment.

  ### Examples

    iex> Lasagna.total_time_in_minutes(3, 20)
    26

  """
  def total_time_in_minutes(total_layers, minutes_in_oven) do
    preparation_time_in_minutes(total_layers) + minutes_in_oven
  end

  @doc """
  Alarm message.

  ### Examples

    iex> Lasagna.alarm()
    "Ding!"

  """
  def alarm, do: "Ding!"
end
