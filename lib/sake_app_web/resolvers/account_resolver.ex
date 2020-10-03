defmodule SakeAppWeb.Resolvers.AccountResolver do
  alias SakeApp.Accounts

  def create_user(params, _info) do
    Accounts.register_user(params)
  end
  
  def login(%{email: email, password: password}, _info) do
    case Accounts.authenticate_by_email_pass(email, password) do
      {:ok, user} ->
         with {:ok, jwt, _} <- SakeApp.Guardian.encode_and_sign(user),
	      {:ok, _ } <- Accounts.store_token(user, jwt) do
	      {:ok, %{token: jwt}}
	 end
      {:error, _} ->
	 {:ok, %{token: nil}}
    end
  end
end
