defmodule SakeApp.Sake.Product do
  use Ecto.Schema
  import Ecto.Changeset
  
  schema "product" do
    field :name,        :string
    field :price,       :float
    field :polish,      :id
    field :variety,     :id
    field :sub_variety, :id
    field :abv,         :float
    field :description, :string
    field :notes,       :string
    field :rice,        :string

    belongs_to, :brewery, {"brewery", Brewery}
    belongs_to, :region,  {"region", Region}

    timestamps()
  end
end
