defmodule SakeApp.Geography.Region do
  use Ecto.Schema
  import Ecto.Changeset

  @timestamps_opts [type: :utc_datetime_usec]
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "regions" do
    field :name, :string
    field :name_kanji, :string

    timestamps()
  end

  @doc false
  def changeset(region, attrs) do
    region
    |> cast(attrs, [:name, :name_kanji])
    |> validate_required([:name, :name_kanji])
  end
end
