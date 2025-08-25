defmodule FreelancerRates do
  @hours_per_day 8.0
  @days_per_month 22.0

  def to_decimal_discount(percentage) do
    percentage / 100
  end

  def daily_rate(hourly_rate) do
    hourly_rate * @hours_per_day
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * to_decimal_discount(discount)
  end

  def monthly_rate(hourly_rate, discount) do
    ceil(apply_discount(daily_rate(hourly_rate) * @days_per_month, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / apply_discount(daily_rate(hourly_rate), discount), 1)
  end
end
