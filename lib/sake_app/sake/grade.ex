defmodule SakeApp.Sake.Grade do
  use SakeApp.Schema
  import Ecto.Changeset
  
  alias SakeApp.Sake.Product

  schema "grades" do
    field :description, :string
    field :max_polish, :float
    field :min_polish, :float
    field :name, :string

    timestamps()
    
    has_may :products, Product
  end

  @doc false
  def changeset(grade, attrs) do
    grade
    |> cast(attrs, [:name, :min_polish, :max_polish, :description])
    |> validate_required([:name, :min_polish, :max_polish])
    |> validate_inclusion(:min_polish, 0.1..1.0)
    |> validate_inclusion(:max_polish, 0.1..1.0)
    |> unique_constraint(:name)
  end
end
