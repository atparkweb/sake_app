defmodule SakeAppWeb.ProductController do
  use SakeAppWeb, :controller
  
  alias SakeApp.Sake
  alias SakeApp.Sake.Product

  def index(conn, _params) do
    products = Sake.list_products()
    render(conn, products: products)
  end
  
  def show(conn, %{"id" => id}) do
    product = Sake.get_product!(id)
    render(conn, product: product)
  end
  
  def new(conn, _params) do
    changeset = Product.changeset(%Product{})
    render(conn, "new.html", changeset: changeset)
  end
  
  def edit(conn, _params) do
    render(conn, "edit.html")
  end
  
  def create(conn, params) do
    case Sake.create_product(params) do
      {:ok, _product} ->
	conn
	|> put_flash(:success, "Product created")
	|> redirect(to: Routes.product_path(conn, :index))
      {:error, _reason} ->
	conn
	|> put_flash(:error, "Unable to save product")
	|> render("new.html", Product.changeset(%Product{}))
    end
  end
end
