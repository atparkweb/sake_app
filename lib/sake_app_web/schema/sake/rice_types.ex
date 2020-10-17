defmodule SakeAppWeb.Schema.Sake.RiceTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: SakeApp.Repo
  
  alias SakeAppWeb.Resolvers.SakeResolver
  
  object :rice do
    field :name,        :string
    field :name_kanji,  :string
    field :description, :string
    field :prefecture,  :prefecture, resolve: assoc(:prefectures)
  end
  
  object :rice_queries do
    @desc "Get a list of all rice varieties"
    field :all_rice, list_of(:rice) do
      resolve(&SakeResolver.list_rice/3)
    end
    
    @desc "Get a single rice variety by :id"
    field :rice, :rice do
      resolve(&SakeResolver.get_rice/3)
    end
  end
end
