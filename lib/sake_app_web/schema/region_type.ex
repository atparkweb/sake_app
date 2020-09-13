defmodule SakeAppWeb.Schema.RegionType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: SakeApp.Repo
  
  alias SakeAppWeb.Resolvers
  
  object :region do
    field :name,        :string
    field :name_kanji,  :string
    field :inserted_at, :string
    field :updated_at,  :string
  end
  
  object :region_queries do
    @desc "Get a list of regions"
    field :regions, list_of(:region) do
      resolve(&Resolvers.GeographyResolver.list_regions/3)
    end
  end
end
