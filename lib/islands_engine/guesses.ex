defmodule IslandsEngine.Guesses do
  alias __MODULE__

  @enforce_keys [:hits, :misses]
  defstruct [:hits, :misses]

  # ensuring the uniqueness for guesses
  # Elixir's  MapSet data structure will guarantee
  # that each member of MapSet will be unique

  def new(), do:
    %Guesses{hits: MapSet.new(), misses: MapSet.new()}

end
