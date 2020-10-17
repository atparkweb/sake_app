defmodule SakeAppWeb.Schema.Sake.BreweryTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: SakeApp.Repo
  
  alias SakeAppWeb.Resolvers.SakeResolver
  
  object :brewery do
    field :name,        :string
    field :name_kanji,  :string
    field :description, :string
    field :address,     :string
    field :site_url,    :string
    field :prefecture,  :prefecture, resolve: assoc(:prefecture)
  end
  
  object :brewery_queries do
    @desc "Get a list of all breweries"
    field :all_breweries, list_of(:brewery) do
      resolve(&SakeResolver.list_breweries/3)
    end
  end
end
