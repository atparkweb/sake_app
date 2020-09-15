defmodule SakeAppWeb.Schema.GeographyTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: SakeApp.Repo
  
  alias SakeAppWeb.Resolvers.GeographyResolver

  object :region do
    field :name,        :string
    field :name_kanji,  :string
    field :inserted_at, :string
    field :updated_at,  :string
    field :prefectures, list_of(:prefecture), resolve: assoc(:prefectures)
  end
  
  object :region_queries do
    @desc "Get a list of regions"
    field :regions, list_of(:region) do
      resolve(&GeographyResolver.list_regions/3)
    end
  end

  object :prefecture do
    field :id,         :id
    field :name,       :string
    field :name_kanji, :string
    field :region, :region, resolve: assoc(:regions)
  end
  
  object :prefecture_queries do
    @desc "Get a list of prefectures"
    field :prefectures, list_of(:prefecture) do
      resolve(&GeographyResolver.list_prefectures/3)
    end
  end

  object :prefecture_mutations do
  end

  object :prefecture_subscriptions do
  end
end
