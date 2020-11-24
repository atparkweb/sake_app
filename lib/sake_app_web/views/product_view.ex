defmodule SakeAppWeb.ProductView do
  use SakeAppWeb, :view
  
  alias SakeApp.Sake
  
  def product_title(%Sake.Product{name: name, name_kanji: name_kanji}) do
    "#{name} (#{name_kanji})"
  end
end
