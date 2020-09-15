defmodule SakeAppWeb.Schema.SakeTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: SakeApp.Repo
  
  alias SakeAppWeb.Resolvers.SakeResolver
  
  object :product do
    field :name,        :string
    field :abv,         :float
    field :smv,         :float
    field :description, :string
    field :notes,       :string
  end
  
  object :product_queries do
    @desc "Get a list of products"
    field :list_products, list_of(:product) do
      resolve(&SakeResolver.list_products/3)
    end
  end
  
  object :product_mutations do
    field :create_product, :product do
      arg(:name, non_null(:string))
      arg(:abv, :float)
      arg(:smv, :float)
      arg(:description, :string)
      arg(:notes, :string)

      resolve(&SakeResolver.create_product/3)
    end
  end
  
  object :product_subscriptions do
    field :product_created, :product do
    end
  end
end
