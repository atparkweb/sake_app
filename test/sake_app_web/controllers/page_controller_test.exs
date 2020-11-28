defmodule SakeAppWeb.PageControllerTest do
  use SakeAppWeb.ConnCase
  
  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to the admin"
  end
end
