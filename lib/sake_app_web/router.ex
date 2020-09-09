defmodule SakeAppWeb.Router do
  use Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
    
    forward "/api", Absinthe.Plug,
      schema: SakeAppWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: SakeAppWeb.Schema
  end

  scope "/", SakeAppWeb do
    pipe_through :api
  end
end
