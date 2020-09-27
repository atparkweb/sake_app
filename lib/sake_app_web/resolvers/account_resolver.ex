defmodule SakeAppWeb.Resolvers.AccountResolver do
  alias SakeApp.Accounts

  def create_user(params, _info) do
    Accounts.register_user(params)
  end
  
  def login(%{email: email, password: password}, _info) do
    with {:ok, user} <- Accounts.authenticate_by_email_pass(email, password),
         {:ok, jwt, _} <- SakeApp.Guardian.encode_and_sign(user),
         {:ok, _ } <- Accounts.store_token(user, jwt) do
      {:ok, %{token: jwt}}
    end
  end
end
