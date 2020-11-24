defmodule SakeAppWeb.Router do
  use Phoenix.Router
  
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end
  
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
    # forward("/", Absinthe.Plug, schema: SakeAppWeb.Schema)
  end
  
  scope "/admin", SakeAppWeb do
    pipe_through :browser
    
    resources "/product", ProductController, only: [:index, :show]
  end
  
  scope "/api", SakeAppWeb do
    pipe_through :graphql
  end
end
