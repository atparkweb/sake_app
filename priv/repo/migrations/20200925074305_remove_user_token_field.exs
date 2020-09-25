defmodule SakeApp.Repo.Migrations.RemoveUserTokenField do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :token
    end
  end
end
