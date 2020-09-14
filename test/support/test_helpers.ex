defmodule SakeApp.TestHelpers do
  alias SakeApp.Sake
  alias SakeApp.Geography

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
           name: "Yamamoto",
           name_kanji: "山本"
         })
      |> Sake.create_product()

    product
  end
  
  def polish_fixture(attrs \\ %{}) do
    {:ok, polish} =
      attrs
      |> Enum.into(%{
           max_amount: "0.5", 
           name: "Daiginjo",
           name_kanji: "大吟醸"
         })
      |> Sake.create_polish()
      
    polish
  end
  
  def rice_fixture(attrs \\ %{}) do
    {:ok, rice} =
      attrs
      |> Enum.into(%{
           name: "Test Rice",
           name_kanji: "test kanji"
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
end
