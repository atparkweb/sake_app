defmodule SakeApp.Geography do
  @moduledoc """
  The Geography context.
  """

  import Ecto.Query, warn: false
  alias SakeApp.Repo

  alias SakeApp.Geography.Region

  @doc """
  Returns the list of regions.

  ## Examples

      iex> list_regions()
      [%Region{}, ...]

  """
  def list_regions do
    Repo.all(Region)
  end

  @doc """
  Gets a single region.

  Raises `Ecto.NoResultsError` if the Region does not exist.

  ## Examples

      iex> get_region!(123)
      %Region{}

      iex> get_region!(456)
      ** (Ecto.NoResultsError)

  """
  def get_region!(id), do: Repo.get!(Region, id)

  @doc """
  Creates a region.

  ## Examples

      iex> create_region(%{field: value})
      {:ok, %Region{}}

      iex> create_region(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_region(attrs \\ %{}) do
    %Region{}
    |> Region.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a region.

  ## Examples

      iex> update_region(region, %{field: new_value})
      {:ok, %Region{}}

      iex> update_region(region, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_region(%Region{} = region, attrs) do
    region
    |> Region.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a region.

  ## Examples

      iex> delete_region(region)
      {:ok, %Region{}}

      iex> delete_region(region)
      {:error, %Ecto.Changeset{}}

  """
  def delete_region(%Region{} = region) do
    Repo.delete(region)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking region changes.

  ## Examples

      iex> change_region(region)
      %Ecto.Changeset{data: %Region{}}

  """
  def change_region(%Region{} = region, attrs \\ %{}) do
    Region.changeset(region, attrs)
  end

  alias SakeApp.Geography.Prefecture

  @doc """
  Returns the list of prefectures.

  ## Examples

      iex> list_prefectures()
      [%Prefecture{}, ...]

  """
  def list_prefectures do
    Repo.all(Prefecture)
  end

  @doc """
  Gets a single prefecture.

  Raises `Ecto.NoResultsError` if the Prefecture does not exist.

  ## Examples

      iex> get_prefecture!(123)
      %Prefecture{}

      iex> get_prefecture!(456)
      ** (Ecto.NoResultsError)

  """
  def get_prefecture!(id), do: Repo.get!(Prefecture, id)

  @doc """
  Creates a prefecture.

  ## Examples

      iex> create_prefecture(%{field: value})
      {:ok, %Prefecture{}}

      iex> create_prefecture(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_prefecture(attrs \\ %{}) do
    %Prefecture{}
    |> Prefecture.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a prefecture.

  ## Examples

      iex> update_prefecture(prefecture, %{field: new_value})
      {:ok, %Prefecture{}}

      iex> update_prefecture(prefecture, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_prefecture(%Prefecture{} = prefecture, attrs) do
    prefecture
    |> Prefecture.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a prefecture.

  ## Examples

      iex> delete_prefecture(prefecture)
      {:ok, %Prefecture{}}

      iex> delete_prefecture(prefecture)
      {:error, %Ecto.Changeset{}}

  """
  def delete_prefecture(%Prefecture{} = prefecture) do
    Repo.delete(prefecture)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking prefecture changes.

  ## Examples

      iex> change_prefecture(prefecture)
      %Ecto.Changeset{data: %Prefecture{}}

  """
  def change_prefecture(%Prefecture{} = prefecture, attrs \\ %{}) do
    Prefecture.changeset(prefecture, attrs)
  end
end
