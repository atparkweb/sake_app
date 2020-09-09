defmodule SakeApp.Sake.Rice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rice" do
    field :name, :string
    field :name_kanji, :string
    
    belongs_to :prefectures, {"prefecture", Prefecture}, foreign_key: :prefecture

    timestamps()
  end

  @doc false
  def changeset(rice, attrs) do
    rice
    |> cast(attrs, [:name, :name_kanji])
    |> validate_required([:name, :name_kanji])
  end
end
