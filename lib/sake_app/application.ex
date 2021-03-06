defmodule SakeApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      # Start the Ecto repository
      SakeApp.Repo,
      # Start the Cachex memory cache
      {Cachex, name: :sake_app_cache},
      # Start the Telemetry supervisor
      SakeAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SakeApp.PubSub},
      # Start the Endpoint (http/https)
      SakeAppWeb.Endpoint,
      supervisor(Absinthe.Subscription, [SakeAppWeb.Endpoint]),
      # Start a worker by calling: SakeApp.Worker.start_link(arg)
      # {SakeApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SakeApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SakeAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
