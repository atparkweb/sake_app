defmodule SakeApp.SakeTest do
  use SakeApp.DataCase

  alias SakeApp.Sake
  alias SakeApp.TestHelpers

  describe "breweries" do
    alias SakeApp.Sake.Brewery
    
    setup do
      {:ok, prefecture: TestHelpers.prefecture_fixture()}
    end
    
    @valid_attrs %{
      city: "some city",
      name: "some name",
      name_kanji: "some name_kanji",
    }
    @update_attrs %{
      city: "some updated city",
      name: "some updated name",
      name_kanji: "some updated name_kanji"
    }
    @invalid_attrs %{
      city: nil,
      name: nil,
      name_kanji: nil
    }

    test "list_breweries/0 returns all breweries", %{prefecture: prefecture} do
      attrs = Enum.into(%{prefecture: prefecture.id}, @valid_attrs)
      brewery = TestHelpers.brewery_fixture(attrs)
      assert Sake.list_breweries() == [brewery]
    end

    test "get_brewery!/1 returns the brewery with given id", %{prefecture: prefecture} do
      attrs = Enum.into(%{prefecture: prefecture.id}, @valid_attrs)
      brewery = TestHelpers.brewery_fixture(attrs)
      assert Sake.get_brewery!(brewery.id) == brewery
    end

    test "create_brewery/1 with valid data creates a brewery", %{prefecture: prefecture} do
      attrs = Enum.into(%{prefecture: prefecture.id}, @valid_attrs)
      assert {:ok, %Brewery{} = brewery} = Sake.create_brewery(attrs)
      assert brewery.city == "some city"
      assert brewery.name == "some name"
      assert brewery.name_kanji == "some name_kanji"
    end

    test "create_brewery/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sake.create_brewery(@invalid_attrs)
    end

    test "update_brewery/2 with valid data updates the brewery" do
      brewery = TestHelpers.brewery_fixture()
      assert {:ok, %Brewery{} = brewery} = Sake.update_brewery(brewery, @update_attrs)
      assert brewery.city == "some updated city"
      assert brewery.name == "some updated name"
      assert brewery.name_kanji == "some updated name_kanji"
    end

    test "update_brewery/2 with invalid data returns error changeset" do
      brewery = TestHelpers.brewery_fixture()
      assert {:error, %Ecto.Changeset{}} = Sake.update_brewery(brewery, @invalid_attrs)
      assert brewery == Sake.get_brewery!(brewery.id)
    end

    test "delete_brewery/1 deletes the brewery" do
      brewery = TestHelpers.brewery_fixture()
      assert {:ok, %Brewery{}} = Sake.delete_brewery(brewery)
      assert_raise Ecto.NoResultsError, fn -> Sake.get_brewery!(brewery.id) end
    end

    test "change_brewery/1 returns a brewery changeset" do
      brewery = TestHelpers.brewery_fixture()
      assert %Ecto.Changeset{} = Sake.change_brewery(brewery)
    end
  end

  describe "products" do
    alias SakeApp.Sake.Product
    
    setup do
      {:ok, prefecture: TestHelpers.prefecture_fixture(), polish: TestHelpers.polish_fixture(), rice: TestHelpers.rice_fixture()}
    end
    
    @valid_attrs %{abv: 120.5, name: "some name", name_kanji: "some name_kanji"}
    @update_attrs %{abv: 456.7, name: "some updated name", name_kanji: "some updated name_kanji"} 
    @invalid_attrs %{abv: nil, name: nil, name_kanji: nil}

    test "list_products/0 returns all products" do
      product = TestHelpers.product_fixture()
      assert Sake.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = TestHelpers.product_fixture()
      assert Sake.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product", %{prefecture: prefecture, polish: polish, rice: rice} do
      attrs = Enum.into(%{prefecture: prefecture.id, product_polish: polish.id, product_rice: rice.id}, @valid_attrs)
      assert {:ok, %Product{} = product} = Sake.create_product(attrs)
      assert product.abv == 120.5
      assert product.name == "some name"
      assert product.name_kanji == "some name_kanji"
      assert product.product_polish == polish.id
      assert product.prefecture == prefecture.id
      assert product.product_rice == rice.id
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sake.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product", %{prefecture: prefecture, polish: polish, rice: rice} do
      product = TestHelpers.product_fixture()
      attrs = Enum.into(%{prefecture: prefecture.id, product_polish: polish.id, product_rice: rice.id}, @update_attrs)
      assert {:ok, %Product{} = product} = Sake.update_product(product, attrs)
      assert product.abv == 456.7
      assert product.name == "some updated name"
      assert product.name_kanji == "some updated name_kanji"
      assert product.product_polish == polish.id
      assert product.prefecture == prefecture.id
      assert product.product_rice == rice.id
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = TestHelpers.product_fixture()
      assert {:error, %Ecto.Changeset{}} = Sake.update_product(product, @invalid_attrs)
      assert product == Sake.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = TestHelpers.product_fixture()
      assert {:ok, %Product{}} = Sake.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Sake.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = TestHelpers.product_fixture()
      assert %Ecto.Changeset{} = Sake.change_product(product)
    end
  end

  describe "rice" do
    alias SakeApp.Sake.Rice
    
    setup do
      {:ok, prefecture: TestHelpers.prefecture_fixture()}
    end

    @valid_attrs %{name: "some name", name_kanji: "some name_kanji"}
    @update_attrs %{name: "some updated name", name_kanji: "some updated name_kanji"}
    @invalid_attrs %{name: nil, name_kanji: nil, prefecture: nil}

    test "list_rice/0 returns all rice" do
      rice = TestHelpers.rice_fixture()
      assert Sake.list_rice() == [rice]
    end

    test "get_rice!/1 returns the rice with given id" do
      rice = TestHelpers.rice_fixture()
      assert Sake.get_rice!(rice.id) == rice
    end

    test "create_rice/1 with valid data creates a rice", %{prefecture: prefecture} do
      attrs = Enum.into(%{prefecture: prefecture.id}, @valid_attrs)
      assert {:ok, %Rice{} = rice} = Sake.create_rice(attrs)
      assert rice.name == "some name"
      assert rice.name_kanji == "some name_kanji"
      assert rice.prefecture == prefecture.id
    end

    test "create_rice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sake.create_rice(@invalid_attrs)
    end

    test "update_rice/2 with valid data updates the rice", %{prefecture: prefecture} do
      rice = TestHelpers.rice_fixture(%{prefecture: prefecture.id})
      assert {:ok, %Rice{} = rice} = Sake.update_rice(rice, @update_attrs)
      assert rice.name == "some updated name"
      assert rice.name_kanji == "some updated name_kanji"
      assert rice.prefecture == prefecture.id
    end

    test "update_rice/2 with invalid data returns error changeset" do
      rice = TestHelpers.rice_fixture()
      assert {:error, %Ecto.Changeset{}} = Sake.update_rice(rice, @invalid_attrs)
      assert rice == Sake.get_rice!(rice.id)
    end

    test "delete_rice/1 deletes the rice" do
      rice = TestHelpers.rice_fixture()
      assert {:ok, %Rice{}} = Sake.delete_rice(rice)
      assert_raise Ecto.NoResultsError, fn -> Sake.get_rice!(rice.id) end
    end

    test "change_rice/1 returns a rice changeset" do
      rice = TestHelpers.rice_fixture()
      assert %Ecto.Changeset{} = Sake.change_rice(rice)
    end
  end
end
