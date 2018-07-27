## What is Elixir?

### Trivia

Design Goals:
- Compatibility with the Earlang VM
- Productivity
- Extensibility

## Characteristics

- Dynamically Typed - types are inferred in compile and run-time
- Compiled - the compiler generates code that is executed by the BEAM

## Functional Programming

- Evaluation of expressions
- Favors immutable state; meaning that these expressions should have no side-effects
or change any global states during its execution

### Motivation

- better structuring discipline
- no side-effects reduces number of bugs
- suitable for parallelism

### Characteristics

- Higher order functions
- Recursion
- Referential Transparency

## Basic Types and Operators

### Literals and Operators

interesting stuff

- Integer - Separator
  - place it anywhere in number where you find it convinient (w00t)
- Booleans
  - true - everything is truthy
  - false - nil is falsey
  - `and`, `or`, `not` -> `strict`
  - `&&`, `||`, `!` -> `non-strict`
- Strictness
  - `strict` expect actuall boolean values - `true`/`false`
    - `3 and true` raises error msg
  - later works with truthy and falsey as well
    - `3 && true` yields `true`
- Booleans - Comparison Operators
  - `>`, `<`, `>=`, `<=`
  - `!=`, `==`, - non-strict (`15.0 == 15` is `true`)
  - `!==`, `===` - strict (`15.0 === 15` is `false`)
- Atom (~ Symbol from Ruby)

### Collection Types

### Lists

  - []
  - head (`hd`), tail (`tl`)
  - The Cons cell
  - `++` concatenation, `--` subsctraction
### Tuples

  - {}
  - index (`elem`), size (`tuple_size`), replacement (`put_elem`)

| VS             | List              | Tuple             |
|----------------|-------------------|-------------------|
| Structure      | Linked list       | Contiguous memory |
| Insertion      | Fast (prepending) | Expensive         |
| Size           | Slow              | Fast              |
| Fetch by index | Slow              | Fast              |
| Fetch first    | Fast              | Fast              |

Example:
A list of tuples with 2 elements, the first being an atom

```
[{:red, 2}, {:green, 4}, {:blue, 3}]
# equivalent to
[red: 2, green: 4, blue: 3]
```
This empowers us to do something like:

```
list = [red: 2, green: 4, blue: 3]
```

But it is slow.
Let's look at `Maps`

### Maps

Key-value pairs

```
%{:red => 2, :green => 4}
# eql to
%{red: 2, green: 4}
```

Accessing values
- `map[key]` - for key of arbitary type
- `map.key `- when key is an atom
Updating values
- `%{map|key=>value}` - works with any type of key
- `%{map|key: value}` - works only on keys that are atoms

### !Warning

**Collections are Imutable**. Any modification on a collection returns a new collection.

### Composition


