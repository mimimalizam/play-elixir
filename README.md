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
If we try adding coordinate1 again, it will not change much.

## Islands

Within the body of `new/2` there are two conditions we have to meet in order to produce
a valid island. The `offsets/1` function has to return a list of offsets instead of an invalid island key error,
and `add_coordinates/2` neeeds to return a `MapSet` instead of an invalid coordinate error.
If both of those conditions pass, we can return a **tagged** tuple with `:ok`
and the complete island.

In Elixir, the preffered way to handle multiple conditions like this is with the `with/1`
special form. This keeps all the validations in one place, and it gives us a single place
to handle any error that might come up.

### Error

The else clause mathes any error that might arise and passes it on.
We are expecting this to be one of two error types:

- {:error, :invalid_island_type}
- {:error, :invalid_coordinate}
