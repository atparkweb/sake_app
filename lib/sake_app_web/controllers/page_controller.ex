defmodule SakeAppWeb.PageController do
  use SakeAppWeb, :controller
  
  def index(conn, _params) do
    render(conn, "index.html")
  end
end
