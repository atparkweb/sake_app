defmodule SakeAppWeb.Resolvers.GeographyResolver do
  alias SakeApp.Geography
  alias SakeAppWeb.Resolvers.Helpers
  
  def list_regions(_parent, _args, _resolutions) do
    {:ok, Geography.list_regions()}
  end
  
  def create_region(_parent, args, _resolutions) do
    args
    |> Geography.create_region()
    |> case do
         {:ok, :region} ->
           {:ok, :region}
         {:error, changeset} ->
	   {:error, Helpers.extract_error_msg(changeset)}
       end
  end
end
