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
end
