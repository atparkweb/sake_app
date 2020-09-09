defmodule SakeApp.Sake.Polish do
  use Ecto.Schema
  import Ecto.Changeset

  schema "polish" do
    field :amount, :float
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(polish, attrs) do
    polish
    |> cast(attrs, [:name, :amount])
    |> validate_required([:name, :amount])
  end
end
