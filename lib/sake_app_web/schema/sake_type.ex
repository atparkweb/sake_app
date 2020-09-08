defmodule SakeAppWeb.Schema.SakeType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: SakeApp.Repo
end
