defmodule SakeApp.Sake do
  @moduledoc """
  The Sake context
  """
  
  import Ecto.Query, warn: false
  alias SakeApp.Repo
  
  alias SakeApp.Sake.Product
  alias SakeApp.Sake.Brewery

  @doc """
  Returns the list of breweries.

  ## Examples

      iex> list_breweries()
      [%Brewery{}, ...]

  """
  def list_breweries do
    Repo.all(Brewery)
  end

  @doc """
  Gets a single brewery.

  Raises `Ecto.NoResultsError` if the Brewery does not exist.

  ## Examples

      iex> get_brewery!(123)
      %Brewery{}

      iex> get_brewery!(456)
      ** (Ecto.NoResultsError)

  """
  def get_brewery!(id), do: Repo.get!(Brewery, id)

  @doc """
  Creates a brewery.

  ## Examples

      iex> create_brewery(%{field: value})
      {:ok, %Brewery{}}

      iex> create_brewery(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_brewery(attrs \\ %{}) do
    %Brewery{}
    |> Brewery.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a brewery.

  ## Examples

      iex> update_brewery(brewery, %{field: new_value})
      {:ok, %Brewery{}}

      iex> update_brewery(brewery, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_brewery(%Brewery{} = brewery, attrs) do
    brewery
    |> Brewery.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a brewery.

  ## Examples

      iex> delete_brewery(brewery)
      {:ok, %Brewery{}}

      iex> delete_brewery(brewery)
      {:error, %Ecto.Changeset{}}

  """
  def delete_brewery(%Brewery{} = brewery) do
    Repo.delete(brewery)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking brewery changes.

  ## Examples

      iex> change_brewery(brewery)
      %Ecto.Changeset{data: %Brewery{}}

  """
  def change_brewery(%Brewery{} = brewery, attrs \\ %{}) do
    Brewery.changeset(brewery, attrs)
  end

  alias SakeApp.Sake.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end

  alias SakeApp.Sake.Rice

  @doc """
  Returns the list of rice.

  ## Examples

      iex> list_rice()
      [%Rice{}, ...]

  """
  def list_rice do
    Repo.all(Rice)
  end

  @doc """
  Gets a single rice.

  Raises `Ecto.NoResultsError` if the Rice does not exist.

  ## Examples

      iex> get_rice!(123)
      %Rice{}

      iex> get_rice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rice!(id), do: Repo.get!(Rice, id)

  @doc """
  Creates a rice.

  ## Examples

      iex> create_rice(%{field: value})
      {:ok, %Rice{}}

      iex> create_rice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rice(attrs \\ %{}) do
    %Rice{}
    |> Rice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rice.

  ## Examples

      iex> update_rice(rice, %{field: new_value})
      {:ok, %Rice{}}

      iex> update_rice(rice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rice(%Rice{} = rice, attrs) do
    rice
    |> Rice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a rice.

  ## Examples

      iex> delete_rice(rice)
      {:ok, %Rice{}}

      iex> delete_rice(rice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rice(%Rice{} = rice) do
    Repo.delete(rice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rice changes.

  ## Examples

      iex> change_rice(rice)
      %Ecto.Changeset{data: %Rice{}}

  """
  def change_rice(%Rice{} = rice, attrs \\ %{}) do
    Rice.changeset(rice, attrs)
  end

  alias SakeApp.Sake.Type

  @doc """
  Returns the list of types.

  ## Examples

      iex> list_types()
      [%Type{}, ...]

  """
  def list_types do
    Repo.all(Type)
  end

  @doc """
  Gets a single type.

  Raises `Ecto.NoResultsError` if the Type does not exist.

  ## Examples

      iex> get_type!(123)
      %Type{}

      iex> get_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_type!(id), do: Repo.get!(Type, id)
  
  @doc """
  Find a type by fields (query)
  """
  def get_type_by!(query) do
    Repo.get_by!(Type, query)
  end

  @doc """
  Creates a type.

  ## Examples

      iex> create_type(%{field: value})
      {:ok, %Type{}}

      iex> create_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_type(attrs \\ %{}) do
    %Type{}
    |> Type.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a type.

  ## Examples

      iex> update_type(type, %{field: new_value})
      {:ok, %Type{}}

      iex> update_type(type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_type(%Type{} = type, attrs) do
    type
    |> Type.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a type.

  ## Examples

      iex> delete_type(type)
      {:ok, %Type{}}

      iex> delete_type(type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_type(%Type{} = type) do
    Repo.delete(type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking type changes.

  ## Examples

      iex> change_type(type)
      %Ecto.Changeset{data: %Type{}}

  """
  def change_type(%Type{} = type, attrs \\ %{}) do
    Type.changeset(type, attrs)
  end
end
