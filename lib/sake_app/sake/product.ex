defmodule SakeApp.Sake.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @timestamps_opts [type: :utc_datetime_usec]
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "products" do
    field :abv,        :float
    field :name,       :string
    field :name_kanji, :string
    field :acidity,    :float
    field :meter,      :float
    

    belongs_to :rice, {"rice", Rice}, foreign_key: :product_rice
    belongs_to :polish, {"polish", Polish}, foreign_key: :product_polish
    belongs_to :types, {"type", Type}, foreign_key: :type
    belongs_to :prefectures, {"prefecture", Prefecture}, foreign_key: :prefecture
    belongs_to :breweres, {"brewery", Brewery}, foreign_key: :brewery

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :name_kanji, :abv, :acidity, :meter, :product_rice, :product_polish, :type, :prefecture, :brewery])
    |> validate_required([:name, :name_kanji])
  end
end
