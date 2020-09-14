defmodule SakeApp.Sake.Designation do
  use SakeApp.Schema
  import Ecto.Changeset

  schema "designations" do
    field :name, :string
    field :polish_ratio_remain, :float
    field :short_description, :string
    field :long_description, :string

    timestamps()
  end

  @doc false
  def changeset(designation, attrs) do
    designation
    |> cast(attrs, [:name, :polish_ratio_remain, :long_description, :short_description])
    |> validate_required([:name])
  end
end
