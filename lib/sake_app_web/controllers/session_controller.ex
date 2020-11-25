defmodule SakeAppWeb.SessionController do
  use SakeAppWeb, :controller
  
  def new(conn, _) do
    render(conn, "new.html")
  end
  
  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case SakeApp.Accounts.authenticate_by_email_pass(email, password) do
      {:ok, user} ->
	conn
	|> SakeAppWeb.Auth.login(user)
	|> put_flash(:info, "Welcome back")
	|> redirect(to: Routes.page_path(conn, :index))
      {:error, _reason} ->
	conn
	|> put_flash(:error, "Invalid username/password combination")
	|> render("new.html")
    end
  end
  
  def delete(conn, _) do
    conn
    |> SakeAppWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
