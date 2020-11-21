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
  
  pipeline :graphql do
    plug CORSPlug, origin: "http://localhost:3000"
    plug :accepts, ["json"]
    
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: SakeAppWeb.Schema
    forward("/", Absinthe.Plug, schema: SakeAppWeb.Schema)
  end
  
  scope "/api", SakeAppWeb do
    pipe_through :graphql
  end
end
