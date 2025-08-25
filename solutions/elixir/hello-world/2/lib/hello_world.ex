defmodule HelloWorld do
  @doc """
  Simply returns "Hello, World!"
  """
  @spec hello :: String.t()
  # shorthand
  def hello(), do: "Hello, World!"
  # def hello do
  #   "Hello, World!"
  # end
end
