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
  
  def list_prefectures(_parent, _args, _resolutions) do
    {:ok, Geography.list_prefectures()}
  end
  
  def get_prefecture_by_name(_parent, %{ name: name }, _resolutions) do
    case Geography.get_prefecture_by!(name: name) do
      nil ->
  { :error, "Prefecture with name #{name} not found" }
      prefecture ->
        { :ok, prefecture }
    end
  end
  
  def create_prefecture(_parent, args, _resolutions) do
    args
    |> Geography.create_prefecture()
    |> case do
         { :ok, prefecture } ->
           { :ok, prefecture }
         { :error, changeset } ->
           { :error, Helpers.extract_error_msg(changeset) }
       end
  end
end
