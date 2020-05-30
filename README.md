### Notes

#### Common

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


#### Datatypes in Elixir


=================================================================

#### IO/h/i Module

- IO module performs common input/output functions.
- For help on the IO module `h(IO)` use the help module in `IEx`.
- `IO.puts "Hello World"` it writes a string to the console.
- ``` 
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