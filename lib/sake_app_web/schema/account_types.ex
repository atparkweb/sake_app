defmodule SakeAppWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: SakeApp.Repo
  
  alias SakeAppWeb.Resolvers.AccountResolver
  
  object :user do
    field :username, :string
    field :email,    :string
    field :password, :string
  end
  
  object :session do
    field :token, :string
  end
  
  object :account_queries do
    @desc "Login user"
    field :login, type: :session do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      
      resolve(&AccountResolver.login/2)
    end
  end
  
  object :account_mutations do
    @desc "Register a new user"
    field :create_user, type: :user do
      arg(:username, non_null(:string))
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      
      resolve(&AccountResolver.create_user/2)
    end
  end
end
