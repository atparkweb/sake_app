defmodule SakeApp.Sake.Designation do
  use Ecto.Schema
  import Ecto.Changeset

  @timestamps_opts [type: :utc_datetime_usec]
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "designations" do
    field :long_description, :string
    field :name, :string
    field :polish_ratio_remain, :float
    field :short_description, :string

    timestamps()
  end

  @doc false
  def changeset(designation, attrs) do
    designation
    |> cast(attrs, [:name, :polish_ratio_remain, :long_description, :short_description])
    |> validate_required([:name])
  end
end
