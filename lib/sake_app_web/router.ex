defmodule SakeAppWeb.Router do
  use Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
    
    forward "/api", Absinthe.Plug,
      schema: SakeAppWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQl,
      schema: SakeAppWeb.Schema
  end

  scope "/", SakeAppWeb do
    pipe_through :api
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: SakeAppWeb.Telemetry
    end
  end
end
