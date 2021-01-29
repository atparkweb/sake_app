defmodule SakeApp.Sake.Grade do
  use SakeApp.Schema
  import Ecto.Changeset
  
  alias SakeApp.Sake.Product

  schema "grades" do
    field :description, :string
    field :max_polish_remain, :float
    field :min_polish_remain, :float
    field :name, :string

    has_many :products, Product

    timestamps()
  end

  @doc false
  def changeset(grade, attrs) do
    grade
    |> cast(attrs, [:name, :min_polish_remain, :max_polish_remain, :description])
    |> validate_required([:name, :min_polish_remain, :max_polish_remain])
    |> validate_number([:min_polish_remain, :max_polish_remain], [greater_than: 0.0, less_than_or_equal_to: 1.0])
    |> unique_constraint(:name)
  end
end
