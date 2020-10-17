defmodule SakeAppWeb.Schema do
  use Absinthe.Schema
  alias SakeAppWeb.Schema.{
    AccountTypes,
    GeographyTypes
  }
  alias SakeAppWeb.Schema.Sake.{
    BreweryTypes,
    DesignationTypes,
    ProductTypes,
    RiceTypes,
    TypeTypes
  }
  
  import_types(Absinthe.Type.Custom)
  import_types(GeographyTypes)
  import_types(AccountTypes)
  import_types(BreweryTypes)
  import_types(DesignationTypes)
  import_types(ProductTypes)
  import_types(RiceTypes)
  import_types(TypeTypes)
  
  query do
    import_fields(:region_queries)
    import_fields(:prefecture_queries)

    import_fields(:account_queries)

    import_fields(:brewery_queries)
    import_fields(:designation_queries)
    import_fields(:product_queries)
    import_fields(:rice_queries)
    import_fields(:type_queries)
  end
  
  mutation do
    import_fields(:product_mutations)
    import_fields(:account_mutations)
  end
  
  subscription do
    import_fields(:product_subscriptions)
  end
end
