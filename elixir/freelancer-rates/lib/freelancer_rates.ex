defmodule FreelancerRates do
  @daily_rate 8.0
  @billable_days 22

  @doc """
  Calculate the daily rate (8 * hourly_rate).

  ### Examples

    iex> FreelancerRates.daily_rate(60)
    480.0

  """
  def daily_rate(hourly_rate), do: @daily_rate * hourly_rate

  @doc """
  Calculates the total after applying a discount.

  ### Examples

    iex> FreelancerRates.apply_discount(150, 10)
    135.0

  """
  def apply_discount(before_discount, discount),
    do: before_discount - before_discount * discount / 100

  @doc """
  Calculates the monthly rate.

  ### Examples

    iex> FreelancerRates.monthly_rate(77, 10.5)
  """
  def monthly_rate(hourly_rate, discount) do
    (daily_discounted_rate(hourly_rate, discount) * @billable_days) |> ceil
  end

  @doc """
  Calculates the number of budgetable days.

  ### Examples

    iex> FreelancerRates.days_in_budget(2_000, 80, 11)
  """
  def days_in_budget(budget, hourly_rate, discount) do
    (budget / daily_discounted_rate(hourly_rate, discount)) |> Float.floor(1)
  end

  defp daily_discounted_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
  end
end
