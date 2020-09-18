defmodule SakeAppWeb.Schema do
  use Absinthe.Schema
  alias SakeAppWeb.Schema.{
    AccountTypes,
    GeographyTypes,
    SakeTypes
  }
  
  import_types(Absinthe.Type.Custom)
  import_types(SakeTypes)
  import_types(GeographyTypes)
  import_types(AccountTypes)
  
  query do
    import_fields(:product_queries)
    import_fields(:region_queries)
    import_fields(:prefecture_queries)
    import_fields(:account_queries)
  end
  
  mutation do
    import_fields(:product_mutations)
    import_fields(:account_mutations)
  end
  
  subscription do
    import_fields(:product_subscriptions)
  end
end
