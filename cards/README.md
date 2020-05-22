# Cards

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `cards` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cards, "~> 0.1.0"}
  ]
end
```

## Notes

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


