defmodule SakeApp.Sake.Rice do
  use SakeApp.Schema
  import Ecto.Changeset
  
  alias SakeApp.Sake.Product

  schema "rice" do
    field :name, :string
    field :name_kanji, :string
    field :description, :string
    
    belongs_to :prefectures, SakeApp.Geography.Prefecture, foreign_key: :prefecture
    
    has_many :products, Product, foreign_key: :product_rice

    timestamps()
  end

  @doc false
  def changeset(rice, attrs) do
    rice
    |> cast(attrs, [:name, :name_kanji, :prefecture])
    |> cast_assoc(:prefectures)
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
