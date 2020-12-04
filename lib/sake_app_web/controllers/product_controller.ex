defmodule SakeAppWeb.ProductController do
  use SakeAppWeb, :controller
  
  alias SakeApp.Sake

  def index(conn, _params) do
    products = Sake.list_products()
    render(conn, products: products)
  end
  
  def show(conn, %{"id" => id}) do
    product = Sake.get_product!(id)
    render(conn, product: product)
  end
  
  def new(conn, _params) do
    render(conn, "new.html")
  end
  
  def edit(conn, _params) do
    render(conn, "edit.html")
  end
  
  def create(conn, params) do
    case SakeApp.Sake.create_product(params) do
      {:ok, product} ->
	conn
	|> put_flash(:succes, "Product created")
	|> redirect(to: Routes.product_path(conn, :index))
      {:error, _reason} ->
	conn
	|> put_flash(:error, "Unable to save product")
	|> render("new.html")
    end
  end
end
