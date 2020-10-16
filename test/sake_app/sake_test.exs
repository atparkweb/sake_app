defmodule SakeApp.SakeTest do
  use SakeApp.DataCase, asyc: true

  alias SakeApp.Sake
  alias SakeApp.TestHelpers

  describe "breweries" do
    alias SakeApp.Sake.Brewery
    
    setup do
      {:ok, prefecture: TestHelpers.prefecture_fixture()}
    end
    
    @valid_attrs %{
      name: "some name",
      name_kanji: "some name_kanji",
      description: "a valid good sake",
      address: "123 hopper avenue",
      site_url: "https://sake.com"
    }
    @update_attrs %{
      name: "some updated name",
      name_kanji: "some updated name_kanji",
      description: "an updated description",
      address: "456 Elm street",
      site_url: "https://sake2.com"
    }
    @invalid_attrs %{
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
      assert brewery.description == "a valid good sake"
      assert brewery.name == "some name"
      assert brewery.name_kanji == "some name_kanji"
    end

    test "create_brewery/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sake.create_brewery(@invalid_attrs)
    end

    test "update_brewery/2 with valid data updates the brewery" do
      brewery = TestHelpers.brewery_fixture()
      assert {:ok, %Brewery{} = brewery} = Sake.update_brewery(brewery, @update_attrs)
      assert brewery.description == "an updated description"
      assert brewery.address == "456 Elm street"
      assert brewery.site_url == "https://sake2.com"
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
      {:ok, prefecture: TestHelpers.prefecture_fixture(), designation: TestHelpers.designation_fixture(), rice: TestHelpers.rice_fixture(), type: TestHelpers.type_fixture()}
    end
    
    @valid_attrs %{abv: 120.5, acidity: 4.0, smv: 2.3, name: "some name", name_kanji: "some name_kanji", brand: "some brand", brand_kanji: "some brand_kanji"}
    @update_attrs %{abv: 456.7, acidity: 3.0, smv: 1.4, name: "some updated name", name_kanji: "some updated name_kanji", brand: "some updated brand", brand_kanji: "some updated brand_kanji"} 
    @invalid_attrs %{abv: nil, name: nil, name_kanji: nil, brand: nil, brand_kanji: nil}

    test "list_products/0 returns all products", %{prefecture: prefecture, designation: designation, rice: rice} do
      product = TestHelpers.product_fixture(%{prefecture: prefecture.id, designation: designation.id, product_rice: rice.id})
      assert Sake.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id", %{prefecture: prefecture, designation: designation, rice: rice, type: type} do
      product = TestHelpers.product_fixture(%{prefecture: prefecture.id, designation: designation.id, product_rice: rice.id, type: type.id})
      assert Sake.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product", %{prefecture: prefecture, designation: designation, rice: rice, type: type} do
      attrs = Enum.into(%{
        prefecture: prefecture.id,
        designation: designation.id,
        product_rice: rice.id,
        type: type.id
      }, @valid_attrs)
      assert {:ok, %Product{} = product} = Sake.create_product(attrs)
      assert product.abv == 120.5
      assert product.name == "some name"
      assert product.name_kanji == "some name_kanji"
      assert product.brand == "some brand"
      assert product.brand_kanji == "some brand_kanji"
      assert product.designation == designation.id
      assert product.prefecture == prefecture.id
      assert product.product_rice == rice.id
      assert product.type == type.id
      assert product.acidity == 4.0
      assert product.smv == 2.3
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sake.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product", %{prefecture: prefecture, designation: designation, rice: rice, type: type} do
      product = TestHelpers.product_fixture(%{prefecture: prefecture.id, designation: designation.id, product_rice: rice.id, type: type.id})
      attrs = Enum.into(%{prefecture: prefecture.id, designation: designation.id, product_rice: rice.id}, @update_attrs)
      assert {:ok, %Product{} = product} = Sake.update_product(product, attrs)
      assert product.abv == 456.7
      assert product.name == "some updated name"
      assert product.name_kanji == "some updated name_kanji"
      assert product.brand == "some updated brand"
      assert product.brand_kanji == "some updated brand_kanji"
      assert product.designation == designation.id
      assert product.prefecture == prefecture.id
      assert product.product_rice == rice.id
      assert product.type == type.id
      assert product.acidity == 3.0
      assert product.smv == 1.4
    end

    test "update_product/2 with invalid data returns error changeset", %{prefecture: prefecture, designation: designation, rice: rice, type: type} do
      product = TestHelpers.product_fixture(%{prefecture: prefecture.id, designation: designation.id, product_rice: rice.id, type: type.id})
      attrs = Enum.into(%{prefecture: prefecture.id, designation: designation.id, product_rice: rice.id}, @invalid_attrs)
      assert {:error, %Ecto.Changeset{}} = Sake.update_product(product, attrs)
      assert product == Sake.get_product!(product.id)
    end

    test "delete_product/1 deletes the product", %{prefecture: prefecture, designation: designation, rice: rice} do
      product = TestHelpers.product_fixture(%{prefecture: prefecture.id, designation: designation.id, product_rice: rice.id})
      assert {:ok, %Product{}} = Sake.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Sake.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset", %{prefecture: prefecture, designation: designation, rice: rice} do
      product = TestHelpers.product_fixture(%{prefecture: prefecture.id, designation: designation.id, product_rice: rice.id})
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

    test "list_rice/0 returns all rice", %{prefecture: prefecture} do
      rice = TestHelpers.rice_fixture(%{prefecture: prefecture.id})
      assert Sake.list_rice() == [rice]
    end

    test "get_rice!/1 returns the rice with given id", %{prefecture: prefecture} do
      rice = TestHelpers.rice_fixture(%{prefecture: prefecture.id})
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

    test "update_rice/2 with invalid data returns error changeset", %{prefecture: prefecture} do
      rice = TestHelpers.rice_fixture(%{prefecture: prefecture.id})
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

  describe "designations" do
    alias SakeApp.Sake.Designation
    
    @valid_attrs %{long_description: "some long_description", name: "some name", polish_ratio_remain: 120.5, short_description: "some short_description"}
    @update_attrs %{long_description: "some updated long_description", name: "some updated name", polish_ratio_remain: 456.7, short_description: "some updated short_description"}
    @invalid_attrs %{long_description: nil, name: nil, polish_ratio_remain: nil, short_description: nil}

    test "list_designations/0 returns all designations" do
      designation = TestHelpers.designation_fixture(@valid_attrs)
      assert Sake.list_designations() == [designation]
    end

    test "get_designation!/1 returns the designation with given id" do
      designation = TestHelpers.designation_fixture(@valid_attrs)
      assert Sake.get_designation!(designation.id) == designation
    end

    test "create_designation/1 with valid data creates a designation" do
      assert {:ok, %Designation{} = designation} = Sake.create_designation(@valid_attrs)
      assert designation.long_description == "some long_description"
      assert designation.name == "some name"
      assert designation.polish_ratio_remain == 120.5
      assert designation.short_description == "some short_description"
    end

    test "create_designation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sake.create_designation(@invalid_attrs)
    end

    test "update_designation/2 with valid data updates the designation" do
      designation = TestHelpers.designation_fixture(@valid_attrs)
      assert {:ok, %Designation{} = updated_designation} = Sake.update_designation(designation, @update_attrs)
      assert updated_designation.long_description == "some updated long_description"
      assert updated_designation.name == "some updated name"
      assert updated_designation.polish_ratio_remain == 456.7
      assert updated_designation.short_description == "some updated short_description"
    end

    test "update_designation/2 with invalid data returns error changeset" do
      designation = TestHelpers.designation_fixture(@valid_attrs)
      assert {:error, %Ecto.Changeset{}} = Sake.update_designation(designation, @invalid_attrs)
      assert designation == Sake.get_designation!(designation.id)
    end

    test "delete_designation/1 deletes the designation" do
      designation = TestHelpers.designation_fixture(@valid_attrs)
      assert {:ok, %Designation{}} = Sake.delete_designation(designation)
      assert_raise Ecto.NoResultsError, fn -> Sake.get_designation!(designation.id) end
    end

    test "change_designation/1 returns a designation changeset" do
      designation = TestHelpers.designation_fixture(@valid_attrs)
      assert %Ecto.Changeset{} = Sake.change_designation(designation)
    end
  end

  describe "types" do
    alias SakeApp.Sake.Type

    @valid_attrs %{long_description: "some long_description", name: "some name", name_kanji: "some name_kanji", short_description: "some short_description"}
    @update_attrs %{long_description: "some updated long_description", name: "some updated name", name_kanji: "some updated name_kanji", short_description: "some updated short_description"}
    @invalid_attrs %{long_description: nil, name: nil, name_kanji: nil, short_description: nil}

    def type_fixture(attrs \\ %{}) do
      {:ok, type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sake.create_type()

      type
    end

    test "list_types/0 returns all types" do
      type = type_fixture()
      assert Sake.list_types() == [type]
    end

    test "get_type!/1 returns the type with given id" do
      type = type_fixture()
      assert Sake.get_type!(type.id) == type
    end

    test "create_type/1 with valid data creates a type" do
      assert {:ok, %Type{} = type} = Sake.create_type(@valid_attrs)
      assert type.long_description == "some long_description"
      assert type.name == "some name"
      assert type.name_kanji == "some name_kanji"
      assert type.short_description == "some short_description"
    end

    test "create_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sake.create_type(@invalid_attrs)
    end

    test "update_type/2 with valid data updates the type" do
      type = type_fixture()
      assert {:ok, %Type{} = type} = Sake.update_type(type, @update_attrs)
      assert type.long_description == "some updated long_description"
      assert type.name == "some updated name"
      assert type.name_kanji == "some updated name_kanji"
      assert type.short_description == "some updated short_description"
    end

    test "update_type/2 with invalid data returns error changeset" do
      type = type_fixture()
      assert {:error, %Ecto.Changeset{}} = Sake.update_type(type, @invalid_attrs)
      assert type == Sake.get_type!(type.id)
    end

    test "delete_type/1 deletes the type" do
      type = type_fixture()
      assert {:ok, %Type{}} = Sake.delete_type(type)
      assert_raise Ecto.NoResultsError, fn -> Sake.get_type!(type.id) end
    end

    test "change_type/1 returns a type changeset" do
      type = type_fixture()
      assert %Ecto.Changeset{} = Sake.change_type(type)
    end
  end
end
