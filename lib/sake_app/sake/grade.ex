defmodule SakeApp.Sake.Grade do
  use SakeApp.Schema
  import Ecto.Changeset
  
  alias SakeApp.Sake.Product

  schema "grades" do
    field :description, :string
    field :max_polish, :float
    field :min_polish, :float
    field :name, :string

    has_many :products, Product

    timestamps()
  end

  @doc false
  def changeset(grade, attrs) do
    grade
    |> cast(attrs, [:name, :min_polish, :max_polish, :description])
    |> validate_required([:name, :min_polish, :max_polish])
    |> validate_number([:min_polish, :max_polish], [greater_than: 0.0, less_than_or_equal_to: 1.0])
    |> unique_constraint(:name)
  end
end
