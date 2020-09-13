defmodule SakeApp.Sake.Brewery do
  use Ecto.Schema
  import Ecto.Changeset

  @timestamps_opts [type: :utc_datetime_usec]
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "breweries" do
    field :city, :string
    field :name, :string
    field :name_kanji, :string
    
    belongs_to :prefectures, {"prefecture", Prefecture}, foreign_key: :prefecture

    timestamps()
  end

  @doc false
  def changeset(brewery, attrs) do
    brewery
    |> cast(attrs, [:name, :name_kanji, :city, :prefecture])
    |> validate_required([:name, :name_kanji])
  end
end
