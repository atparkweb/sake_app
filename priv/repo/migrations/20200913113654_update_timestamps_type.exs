defmodule SakeApp.Repo.Migrations.UpdateTimestampsType do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :inserted_at
      remove :updated_at
      timestamps([type: :utc_datetime_usec])
    end
    alter table(:types) do
      remove :inserted_at
      remove :updated_at
      timestamps([type: :utc_datetime_usec])
    end
    alter table(:rice) do
      remove :inserted_at
      remove :updated_at
      timestamps([type: :utc_datetime_usec])
    end
    alter table(:regions) do
      remove :inserted_at
      remove :updated_at
      timestamps([type: :utc_datetime_usec])
    end
    alter table(:products) do
      remove :inserted_at
      remove :updated_at
      timestamps([type: :utc_datetime_usec])
    end
    alter table(:prefectures) do
      remove :inserted_at
      remove :updated_at
      timestamps([type: :utc_datetime_usec])
    end
    alter table(:polish) do
      remove :inserted_at
      remove :updated_at
      timestamps([type: :utc_datetime_usec])
    end
    alter table(:breweries) do
      remove :inserted_at
      remove :updated_at
      timestamps([type: :utc_datetime_usec])
    end
  end
end
