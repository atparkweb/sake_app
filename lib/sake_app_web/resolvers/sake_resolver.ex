defmodule SakeAppWeb.Resolvers.SakeResolver do
  alias SakeApp.Sake
  alias SakeAppWeb.Resolvers.Helpers
  
  def list_products(_parent, _args, _resolutions) do
    {:ok, Sake.list_products()}
  end
  
  def create_product(_parent, args, _resolutions) do
    args
    |> Sake.create_product()
    |> case do
         {:ok, :product} ->
           {:ok, :product}
         {:error, changeset} ->
           {:error, Helpers.extract_error_msg(changeset)}
       end
  end
  
  def list_breweries(_parent, _args, _resolutions) do
    {:ok, Sake.list_breweries()}
  end
  
  def list_rice(_parent, _args, _resolutions) do
    {:ok, Sake.list_rice()}
  end
  
  def get_designation(_parent, %{id: id}, _resolutions) do
    case Sake.get_designation!(id) do
      nil ->
	{:error, "Designation with id #{id} not found"}
      designation ->
	{:ok, designation}
    end
  end
  
  def list_designations(_parent, _args, _resolutions) do
    {:ok, Sake.list_designations()}
  end

  def list_types(_parent, _args, _resolutions) do
    {:ok, Sake.list_types()}
  end
  
  def get_type_by_name(_parent, %{name: name}, _resolutions) do
    case Sake.get_type_by!(name: name) do
      nil ->
        { :error, "Type with name #{name} not found"}
      type ->
	{ :ok, type }
    end
  end
end
