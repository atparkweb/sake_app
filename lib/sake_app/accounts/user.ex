defmodule SakeApp.Accounts.User do
  use SakeApp.Schema
  import Ecto.Changeset
  
  schema "users" do
    field :birthdate, :date
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password_hash, :birthdate])
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
  
  @doc false
  def registration_changeset(user, attrs) do
    user
    |> changeset(attrs)
    |> cast(attrs, [:password])
    |> validate_required(:password)
    |> validate_length(:password, min: 8, max: 100)
    |> validate_format(:password, ~r/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/)
    |> put_pass_hash()
  end
  
  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(pass))
      _ ->
        changeset
    end
  end
end
