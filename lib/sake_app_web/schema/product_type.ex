defmodule SakeAppWeb.Schema.ProductType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: SakeApp.Repo
  
  alias SakeAppWeb.Resolvers
  
  object :product do
    field :name,        :string
    field :price,       :float
    field :abv,         :float
    field :description, :string
    field :notes,       :string
    field :rice,        :string
    field :polish,      :id
    field :brewery,     :id
    field :region,      :id
  end
  
  object :product_queries do
    @desc "Get a list of products"
    field :list_products, list_of(:product) do
      resolve(&Resolvers.SakeResolver.list_products/3)
    end
  end
  
  object :product_mutations do
    field :create_product, :product do
      arg(:name, non_null(:string))
      arg(:price, :float)
      arg(:abv, :float)
      arg(:description, :string)
      arg(:notes, :string)
      arg(:rice, :id)
      arg(:polish, :id)
      arg(:brewery, :id)
      arg(:region, :id)

      resolve(&Resolvers.SakeResolver.create_product/3)
    end
  end
  
  object :product_subscriptions do
    field :product_created, :product do
    end
  end
end
