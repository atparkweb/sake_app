defmodule SakeApp.Sake.Type do
  use Ecto.Schema
  import Ecto.Changeset

  schema "types" do
    field :long_description, :string
    field :name, :string
    field :name_kanji, :string
    field :short_description, :string

    timestamps()
  end

  @doc false
  def changeset(type, attrs) do
    type
    |> cast(attrs, [:name, :name_kanji, :short_description, :long_description])
    |> validate_required([:name, :name_kanji])
  end
end
