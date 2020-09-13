defmodule SakeApp.Sake.Polish do
  use Ecto.Schema
  import Ecto.Changeset

  schema "polish" do
    field :max_amount, :float
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(polish, attrs) do
    polish
    |> cast(attrs, [:name, :max_amount])
    |> validate_required([:name])
  end
end
