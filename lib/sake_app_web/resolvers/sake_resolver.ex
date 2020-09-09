defmodule SakeAppWeb.Resolvers.SakeResolver do
  alias SakeApp.Sake
  
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
           {:error, extract_error_msg(changeset)}
       end
  end
  
  def extract_error_msg(changeset) do
    changeset.errors
    |> Enum.map(fn {field, {error, _details}} ->
         [
	   field: field,
           message: String.capitalize(error)
	 ]
    end)
  end
end
