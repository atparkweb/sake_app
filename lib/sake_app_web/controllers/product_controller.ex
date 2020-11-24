defmodule SakeAppWeb.ProductController do
  use SakeAppWeb, :controller
  
  alias SakeApp.Sake

  def index(conn, _params) do
    products = Sake.list_products()
    render(conn, "product/index.html", products: products)
  end
  
  def show(conn, %{"id" => id}) do
    product = Sake.get_product!(id)
    render(conn, "product/show.html", product: product)
  end
end
