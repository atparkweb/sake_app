# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sake_app,
  ecto_repos: [SakeApp.Repo]

# Configures the endpoint
config :sake_app, SakeAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Sj8Bf65hEvsaHVlNKyy3Rk0xcfu4qUDIAqoM8XhbzSiXOobXdclcaeRtQEEQe9Ks",
  render_errors: [view: SakeAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SakeApp.PubSub,
  live_view: [signing_salt: "Mrmc0yZF"]

config :sake_app, SakeApp.Guardian,
  # optional
  allowed_algos: ["HS512"],
  # optional
  verify_module: Guardian.JWT,
  issuer: "SakeApp",
  ttl: {30, :days},
  allowed_drift: 2000,
  #optional
  verify_issuer: true,
  # generated using: JOSE.JWK.generate_key({:oct, 16}) |> JOSE.JWK.to_map |> elem(1)
  secret_key: %{"k" => "73vTD523Jc-9Q5D1FlDjIg", "kty" => "oct"},
  serializer: SakeApp.Guardian

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
