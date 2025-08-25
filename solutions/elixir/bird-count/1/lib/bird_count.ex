defmodule BirdCount do
  def today([]), do: nil
  def today([head | _tail]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([today | past_days]), do: [today + 1 | past_days]

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([day | remaining_days]) do
    day === 0 || has_day_without_birds?(remaining_days)
  end

  #def total(list), do: List.foldl(list, 0, fn current, so_far -> current + so_far end)
  #
  # practice recursion
  def total([]), do: 0
  def total([day | remaining_days]), do: day + total(remaining_days)

  # staight recursion
  #def busy_days([]), do: 0

  #def busy_days([day | remaining_days]) do
  #  if(day >= 5, do: 1, else: 0) + busy_days(remaining_days)
  #end

  # tail-call optimization
  def busy_days(list), do: busy_days(list, 0)

  defp busy_days([], count), do: count

  defp busy_days([day | remaining_days], count) when day <  5 do
    busy_days(remaining_days, count)
  end

  defp busy_days([day | remaining_days], count) when day >= 5 do
    busy_days(remaining_days, count + 1)
  end
end
