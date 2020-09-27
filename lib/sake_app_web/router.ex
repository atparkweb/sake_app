defmodule SakeAppWeb.Router do
  use Phoenix.Router
  
  pipeline :protected do
    plug CORSPlug, origin: "http://localhost:3000"
    plug :accepts, ["json"]
    plug :fetch_session
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardian.Plug.LoadResource
  end
  
  pipeline :api do
    plug CORSPlug, origin: "http://localhost:3000"
    plug :accepts, ["json"]
    
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: SakeAppWeb.Schema

    plug Absinthe.Plug, schema: SakeAppWeb.Schema
  end
  
  scope "/login", SakeAppWeb do
    pipe_through :api
  end

  scope "/api/v1", SakeAppWeb do
    pipe_through [:api, :protected]
  end
end
