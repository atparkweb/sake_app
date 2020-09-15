defmodule SakeAppWeb.Schema do
  use Absinthe.Schema
  alias SakeAppWeb.Schema.{
    GeographyTypes,
    SakeTypes
  }
  
  import_types(Absinthe.Type.Custom)
  import_types(SakeTypes)
  import_types(GeographyTypes)
  
  query do
    import_fields(:product_queries)
    import_fields(:region_queries)
    import_fields(:prefecture_queries)
  end
  
  mutation do
    import_fields(:product_mutations)
  end
  
  subscription do
    import_fields(:product_subscriptions)
  end
end
