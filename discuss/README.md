# Discuss

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

### Phoneix Notes

#### To creat a migration in the project folder

```
mix ecto.gen.migration add_topics
mix ecto.migrate

```

#### Crate a new struct

```
 struct = %DiscussWeb.Topic{}
```
