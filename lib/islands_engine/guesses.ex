defmodule IslandsEngine.Guesses do
  alias IslandsEngine.{Coordinate, Guesses}

  @enforce_keys [:hits, :misses]
  defstruct [:hits, :misses]

  # ensuring the uniqueness for guesses
  # Elixir's  MapSet data structure will guarantee
  # that each member of MapSet will be unique

  def new(), do:
    %Guesses{hits: MapSet.new(), misses: MapSet.new()}

  def add(%Guesses{} = guesses, :hit, %Coordinate{} = coordinate), do:
   update_in(guesses.hits, &MapSet.put(&1, coorddinate))

  def add(%Guesses{} = guesses, :misses, %Coordinate{} = coordinate), do:
   update_in(guesses.misses, &MapSet.put(&1, coorddinate))

end
