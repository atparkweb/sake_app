defmodule SakeApp.Geography.Region do
  use SakeApp.Schema
  import Ecto.Changeset

  schema "regions" do
    field :name, :string
    field :name_kanji, :string
    has_many :prefectures, SakeApp.Geography.Prefecture, foreign_key: :region

    timestamps()
  end

  @doc false
  def changeset(region, attrs) do
    region
    |> cast(attrs, [:name, :name_kanji])
    |> validate_required([:name, :name_kanji])
    |> unique_constraint(:name)
  end
end
