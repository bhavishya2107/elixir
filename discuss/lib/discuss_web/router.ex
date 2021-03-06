defmodule DiscussWeb.Router do
  use DiscussWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", DiscussWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
    # get("/topics/new", TopicController, :new)
    # post("/topics", TopicController, :create)
    # get("/topics/:id/edit", TopicController, :edit)
    # put("/topics/:id/edit", TopicController, :update)
    resources "/topics", TopicController
  end

  scope "/auth", DiscussWeb do
    pipe_through(:browser)

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through(:browser)
      live_dashboard("/dashboard", metrics: DiscussWeb.Telemetry)
    end
  end
end
