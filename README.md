## playing in iex

Start IEx session by running `iex -S mix` at the root
of the project directory.

Aliasing a modules can be done with:

```
iex> alias IslandsEngine.Coordinate
iex> Coordinate.new(1,1)
iex> %Coordinate{row: 5}
** Argument Error something something
```
```
iex> alias IslandsEngine.{Coordinate, Guesses}
iex> guesses = Guesses.new
iex> {:ok, coordinate1} = Coordinate.new(1,1)
iex> {:ok, coordinate2} = Coordinate.new(2,2)
```

Adding `coordinate1` to the set of hits with the `Kernel.update_in/2` function.
`update_in/2` takes a path to the nested data structure we want to update
and a function to transform its value.
`update_in/2` will pass that structure into the function as the first argument.

```
iex> guesses = update_in(guesses.hits, &MapSet.put(&1, coordinate1))
```

What just happend is a **transformation**.
The original value for `guess` is unchanged yet.
We need to rebind it to the `guess` variable.
Once that rebinding happens, the original value will fall out of scope
and be garbage collected.

```
iex> guesses = update_in(guesses.hits, &MapSet.put(&1, coordinate2))
```
If we try adding coordinate1 again, it will not change much
