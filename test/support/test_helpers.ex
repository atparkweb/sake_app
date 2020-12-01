defmodule SakeApp.TestHelpers do
  alias SakeApp.Sake
  alias SakeApp.Geography
  alias SakeApp.Accounts

  def prefecture_fixture(attrs \\ %{}) do
    {:ok, region} = Geography.create_region(%{
      name: "Tohoku",
      name_kanji: "東北"
    })

    {:ok, prefecture} = 
      attrs
      |> Enum.into(%{
     name: "Akita",
     name_kanji: "秋田",
     region: region.id
   })
      |> Geography.create_prefecture()
    
    prefecture
  end

  def brewery_fixture(attrs \\ %{}) do

    {:ok, brewery} =
      attrs
      |> Enum.into(%{
           name: "Test Brewery",
           name_kanji: "山本"
         })
      |> Sake.create_brewery()

    brewery
  end

  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
           name: "Green Label",
	   brand: "Yamamoto",
         })
      |> Sake.create_product()

    product
  end
  
  def rice_fixture(attrs \\ %{}) do
    {:ok, rice} =
      attrs
      |> Enum.into(%{
           name: "Test Rice",
         })
      |> Sake.create_rice()
    rice
  end
  
  def designation_fixture(attrs \\ %{}) do
    {:ok, designation} =
      attrs
      |> Enum.into(%{
           name: "Test Designation",
           polish_ratio_remain: 0.5,
           short_description: "this is a description of a designation",
           long_description: "this is a longer description of a designation"
         })
      |> Sake.create_designation()
      
    designation
  end

  def type_fixture(attrs \\ %{}) do
    {:ok, type} =
      attrs
      |> Enum.into(%{
           name: "Test type",
           short_description: "this is a description of a type",
           long_description: "this is a longer description of a type"
         })
      |> Sake.create_type()
      
    type
  end
  
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
	  username: "user#{System.unique_integer([:positive])}",
	  email: "user@example.com",
	  birthdate: ~D[1981-04-17],
	  password: "Secret123"
      })
      |> Accounts.register_user()
    user
  end
end
