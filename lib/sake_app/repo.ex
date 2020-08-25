defmodule SakeApp.Repo do
  use Ecto.Repo,
    otp_app: :sake_app,
    adapter: Ecto.Adapters.Postgres
end
