defmodule SakeAppWeb.Schema.Sake.TypeTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: SakeApp.Repo
  
  alias SakeAppWeb.Resolvers.SakeResolver
  
  object :type do
    field :name,              :string
    field :name_kanji,        :string
    field :short_description, :string
    field :long_description,  :string
  end
  
  object :type_queries do
    @desc "Get a list of all types"
    field :all_types, list_of(:type) do
      resolve(&SakeResolver.list_types/3)
    end
  end
end
