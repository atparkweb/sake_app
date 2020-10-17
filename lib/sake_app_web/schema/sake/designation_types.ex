defmodule SakeAppWeb.Schema.Sake.DesignationTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: SakeApp.Repo
  
  alias SakeAppWeb.Resolvers.SakeResolver
  
  object :designation do
    field :name,                :string
    field :polish_ratio_remain, :float
    field :short_description,   :string
    field :long_description,    :string
  end
  
  object :designation_queries do
    @desc "Get a list of all designations"
    field :all_designations, list_of(:designation) do
      resolve(&SakeResolver.list_designations/3)
    end
    
    @desc "Get a single designation by :id"
    field :get_designation, :designation do
      arg :id, non_null(:id)
      resolve(&SakeResolver.get_designation/3)
    end
  end
end
