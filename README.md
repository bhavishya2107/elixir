### Common Terms in Elixir

- `Modules` is elixir are collections of methods.

- Elixir is a functional language.

- Code => Elixir => Erlang => BEAM

#### Enter the interactive shell

```
  iex -S mix
```

#### Run a module/file

```
 Cards.create_deck()
```

#### Install all the dependencies

```
mix deps.get
```

#### Creating docs

- install :ex_doc
- @moduledoc """
  Documentation Content
  """
- run `mix docs`
- index.html file is created in doc folder
- for writing docs for single methods we use @doc """ method content """ 

#### ENUM Module

`enumerable` is like a list of records.
All the methods to handle the enumerable are in the ENUM module

```
Enum.shuffle(enum), Enum.member?(enum,element)
```

#### List Module

`list.flatten` sumsup all the list into a single list

#### Pattern Matching

Pattern matching is used for variable assignment.

#### Pipe operator

#### Testing in elixir

Testing can be two types in elixir,

- Writing @doc """ testing_expressions """
- Writing doctest cases in test folder

  ```
  test "create_deck makes 20 cards" do
  deck_length = length(Cards.create_deck())
  assert deck_length == 20
  end
  ```

#### Map in elixir

- Map in elixir is similar to objects in JS or hashes in ruby
- Map is collection of key, value pair


---

### Elixir Notes

#### IO/h/i Module

- IO module performs common input/output functions.
- For help on the IO module `h(IO)` use the help module in `IEx`.
- `IO.puts "Hello World"` it writes a string to the console.

```
iex> i 123
Term
  123
Data type
  Integer
Reference modules
  Integer
Implemented protocols
  IEx.Info, Inspect, List.Chars, String.Chars
```

> Elixir is great for writing highly parallel, reliable applications.
But to be a great language for parallel programming, a language first has to be great
for conventional, sequential programming. In this part of the book we’ll cover how to
write Elixir code, and explore the idioms and conventions that make Elixir so powerful.

#### Pattern Matching in Elixir

- There is no assignment operator in elixir, elixir call the `=` symbol the `match operator`.
- As there is no assignment the `=` operator represents an assertion.

```
iex> list = [1, 2, [ 3, 4, 5 ] ]
[1, 2, [3, 4, 5]]
iex> [a, b, c ] = list
[1, 2, [3, 4, 5]]
iex> a
1
iex> b
2
iex> c
[3, 4, 5]
```

- The `match operator` not only is used for simple values but it is also useful for destructuring complex data types.
- If you don't want to capture a value during the match, you can ignore it by using the `_` operator.
- If you want to use the existing value of a variable in the pattern.Prefix it with a `^` opeartor called the `pin operator`.

```
iex> a = 1
1
iex> [^a, 2, 3 ] = [ 1, 2, 3 ]
# use existing value of a
[1, 2, 3]
iex> a = 2
2
iex> [ ^a, 2 ] = [ 1, 2 ]
** (MatchError) no match of right hand side value: [1, 2]
```

#### Immutable Data

- In Elixir data is immutable.
  For Example,
  Let there be a `list` `[1,2,3]` if we want to add 100 to each of its item.Elixir will make a copy of the original instead of mutating the `list`.
- The Idea of Elixir is to tranfer and transform data.
```
iex> list1 = [ 3, 2, 1 ]
[3, 2, 1]
iex> list2 = [ 4 | list1 ]
[4, 3, 2, 1]
```
- Example,
```
iex> name = "elixir"
"elixir"
iex> cap_name = String.capitalize name
"Elixir"
iex> name
"elixir"
```

#### Data Types in Elixir

Elixir’s built-in types are

• Value types:
– Integers
– Floating-point numbers
– Atoms
  - Atoms are constants that represent something’s name.
  - We write them using a leading colon ( : ),
– Ranges
  Ranges are represented as start..end, where start and end are integers.
– Regular expressions

• System types:
– PIDs and ports
  - A PID is a reference to a local or remote process, and a port is a reference to a resource (typically external to the application) that you’ll be reading or writing.
  - The PID of the current process is available by calling self. A new PID is created when you spawn a new process.
– References

• Collection types:
– Tuples
    A tuple is an ordered collection of values. As with all Elixir data structures,once created a tuple cannot be modified.

– Lists

  - These are linkedList very different from an array.

```
# Elixir has some operators that work specifically on lists:
iex> [ 1, 2, 3 ] ++ [ 4, 5, 6 ]
[1, 2, 3, 4, 5, 6]
iex> [1, 2, 3, 4] -- [2, 4]
[1, 3]
iex> 1 in [1,2,3,4]
true
iex> "wombat" in [1, 2, 3, 4]
false
```
– Maps
– Binaries

#### Anonymous Functions

An anonymous function is created using the fn keyword.
```
fn
parameter-list -> body
parameter-list -> body ...
end
```

```
iex> multiply = fn (a,b) -> (a * b) end 
#Function<43.97283095/2 in :erl_eval.expr/5>
iex)> multiply.(1, 2)                   
2
iex> multiply.(4,6)                    
24
iex> list_concat = fn ([a,b],[c,d]) -> [a,b] ++ [c,d] end
#Function<43.97283095/2 in :erl_eval.expr/5>
iex> list_concat.([1,2],[3,4])
[1, 2, 3, 4]
iex> sum_2 = fn (a,b,c) -> a + b + c end
#Function<42.97283095/3 in :erl_eval.expr/5>
iex> sum_2.(4,3,4)
11
iex> pair = fn ({a,b}) -> [a,b] end
#Function<44.97283095/1 in :erl_eval.expr/5>
iex> pair.({1234,4321})
[1234, 4321]
```



