defmodule FreelancerRates do
  @hours_per_day 8.0
  @days_per_month 22.0

  def daily_rate(hourly_rate) do
    hourly_rate * @hours_per_day
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * to_decimal_discount(discount)
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate
    |> then(fn daily   -> daily * @days_per_month end)
    |> then(fn monthly -> apply_discount(monthly, discount) end)
    |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # suggested:
    with daily_rate    <- daily_rate(hourly_rate),
         discount_rate <- apply_discount(daily_rate, discount),
         budgeted_days <- budget / discount_rate do
      Float.floor(budgeted_days, 1)
    end
  end

  defp to_decimal_discount(percentage) do
    percentage / 100
  end
end
