defmodule SakeAppWeb.Schema do
  use Absinthe.Schema
  
  import_types(Absinthe.Type.Custom)
  import_types(SakeAppWeb.Schema.SakeType)
  
  query do
    import_fields(:sake_queries)
  end
  
  mutation do
    import_fields(:sake_mutations)
  end
  
  subscription do
    import_fields(:sake_subscriptions)
  end
end
