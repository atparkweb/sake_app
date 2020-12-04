defmodule SakeAppWeb.Router do
  use SakeAppWeb, :router
  
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug SakeAppWeb.Auth
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
  
  scope "/", SakeAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/session", SessionController, only: [:new, :create, :delete]
  end
  
  # protected scope
  scope "/admin", SakeAppWeb do
    pipe_through [:browser, :authenticate_user]
    
    resources "/product", ProductController, only: [:index, :new, :show, :edit, :create]
  end
  
  scope "/api", SakeAppWeb do
    pipe_through :graphql
  end
end
