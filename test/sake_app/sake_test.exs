defmodule SakeApp.SakeTest do
  use SakeApp.DataCase

  alias SakeApp.Sake

  describe "breweries" do
    alias SakeApp.Sake.Brewery

    @valid_attrs %{city: "some city", name: "some name", name_kanji: "some name_kanji"}
    @update_attrs %{city: "some updated city", name: "some updated name", name_kanji: "some updated name_kanji"}
    @invalid_attrs %{city: nil, name: nil, name_kanji: nil}

    def brewery_fixture(attrs \\ %{}) do
      {:ok, brewery} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sake.create_brewery()

      brewery
    end

    test "list_breweries/0 returns all breweries" do
      brewery = brewery_fixture()
      assert Sake.list_breweries() == [brewery]
    end

    test "get_brewery!/1 returns the brewery with given id" do
      brewery = brewery_fixture()
      assert Sake.get_brewery!(brewery.id) == brewery
    end

    test "create_brewery/1 with valid data creates a brewery" do
      assert {:ok, %Brewery{} = brewery} = Sake.create_brewery(@valid_attrs)
      assert brewery.city == "some city"
      assert brewery.name == "some name"
      assert brewery.name_kanji == "some name_kanji"
    end

    test "create_brewery/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sake.create_brewery(@invalid_attrs)
    end

    test "update_brewery/2 with valid data updates the brewery" do
      brewery = brewery_fixture()
      assert {:ok, %Brewery{} = brewery} = Sake.update_brewery(brewery, @update_attrs)
      assert brewery.city == "some updated city"
      assert brewery.name == "some updated name"
      assert brewery.name_kanji == "some updated name_kanji"
    end

    test "update_brewery/2 with invalid data returns error changeset" do
      brewery = brewery_fixture()
      assert {:error, %Ecto.Changeset{}} = Sake.update_brewery(brewery, @invalid_attrs)
      assert brewery == Sake.get_brewery!(brewery.id)
    end

    test "delete_brewery/1 deletes the brewery" do
      brewery = brewery_fixture()
      assert {:ok, %Brewery{}} = Sake.delete_brewery(brewery)
      assert_raise Ecto.NoResultsError, fn -> Sake.get_brewery!(brewery.id) end
    end

    test "change_brewery/1 returns a brewery changeset" do
      brewery = brewery_fixture()
      assert %Ecto.Changeset{} = Sake.change_brewery(brewery)
    end
  end

  describe "products" do
    alias SakeApp.Sake.Product

    @valid_attrs %{abv: 120.5, name: "some name", name_kanji: "some name_kanji", product_polish: 42, prefecture: 42, product_rice: 42}
    @update_attrs %{abv: 456.7, name: "some updated name", name_kanji: "some updated name_kanji", product_polish: 43, prefecture: 43, product_rice: 43} 
    @invalid_attrs %{abv: nil, name: nil, name_kanji: nil, product_polish: nil, prefecture: nil, product_rice: nil }

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sake.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Sake.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Sake.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Sake.create_product(@valid_attrs)
      assert product.abv == 120.5
      assert product.name == "some name"
      assert product.name_kanji == "some name_kanji"
      assert product.product_polish == 42
      assert product.prefecture == 42
      assert product.product_rice == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sake.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Sake.update_product(product, @update_attrs)
      assert product.abv == 456.7
      assert product.name == "some updated name"
      assert product.name_kanji == "some updated name_kanji"
      assert product.product_polish == 43
      assert product.prefecture == 43
      assert product.product_rice == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Sake.update_product(product, @invalid_attrs)
      assert product == Sake.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Sake.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Sake.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Sake.change_product(product)
    end
  end

  describe "rice" do
    alias SakeApp.Sake.Rice

    @valid_attrs %{name: "some name", name_kanji: "some name_kanji", prefecture: 42}
    @update_attrs %{name: "some updated name", name_kanji: "some updated name_kanji", prefecture: 43}
    @invalid_attrs %{name: nil, name_kanji: nil, prefecture: nil}

    def rice_fixture(attrs \\ %{}) do
      {:ok, rice} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sake.create_rice()

      rice
    end

    test "list_rice/0 returns all rice" do
      rice = rice_fixture()
      assert Sake.list_rice() == [rice]
    end

    test "get_rice!/1 returns the rice with given id" do
      rice = rice_fixture()
      assert Sake.get_rice!(rice.id) == rice
    end

    test "create_rice/1 with valid data creates a rice" do
      assert {:ok, %Rice{} = rice} = Sake.create_rice(@valid_attrs)
      assert rice.name == "some name"
      assert rice.name_kanji == "some name_kanji"
      assert rice.prefecture == 42
    end

    test "create_rice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sake.create_rice(@invalid_attrs)
    end

    test "update_rice/2 with valid data updates the rice" do
      rice = rice_fixture()
      assert {:ok, %Rice{} = rice} = Sake.update_rice(rice, @update_attrs)
      assert rice.name == "some updated name"
      assert rice.name_kanji == "some updated name_kanji"
      assert rice.prefecture == 43
    end

    test "update_rice/2 with invalid data returns error changeset" do
      rice = rice_fixture()
      assert {:error, %Ecto.Changeset{}} = Sake.update_rice(rice, @invalid_attrs)
      assert rice == Sake.get_rice!(rice.id)
    end

    test "delete_rice/1 deletes the rice" do
      rice = rice_fixture()
      assert {:ok, %Rice{}} = Sake.delete_rice(rice)
      assert_raise Ecto.NoResultsError, fn -> Sake.get_rice!(rice.id) end
    end

    test "change_rice/1 returns a rice changeset" do
      rice = rice_fixture()
      assert %Ecto.Changeset{} = Sake.change_rice(rice)
    end
  end
end
