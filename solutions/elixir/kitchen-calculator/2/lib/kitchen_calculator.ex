defmodule KitchenCalculator do
  def get_volume({_, volume}), do: volume

  def to_milliliter({:milliliter, v}),  do: {:milliliter, v}
  def to_milliliter({:cup, v}),         do: {:milliliter, v * 240}
  def to_milliliter({:fluid_ounce, v}), do: {:milliliter, v * 30}
  def to_milliliter({:teaspoon, v}),    do: {:milliliter, v * 5}
  def to_milliliter({:tablespoon, v}),  do: {:milliliter, v * 15}

  def from_milliliter({:milliliter, v}, u = :milliliter),  do: {u, v}
  def from_milliliter({:milliliter, v}, u = :cup),         do: {u, v / 240}
  def from_milliliter({:milliliter, v}, u = :fluid_ounce), do: {u, v / 30}
  def from_milliliter({:milliliter, v}, u = :teaspoon),    do: {u, v / 5}
  def from_milliliter({:milliliter, v}, u = :tablespoon),  do: {u, v / 15}

  def convert(volume_pair, desired_unit) do
    volume_pair
    |> to_milliliter
    |> from_milliliter(desired_unit)
  end
end
