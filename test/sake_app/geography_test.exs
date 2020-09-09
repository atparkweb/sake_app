defmodule SakeApp.GeographyTest do
  use SakeApp.DataCase

  alias SakeApp.Geography

  describe "regions" do
    alias SakeApp.Geography.Region

    @valid_attrs %{name: "some name", name_kanji: "some name_kanji"}
    @update_attrs %{name: "some updated name", name_kanji: "some updated name_kanji"}
    @invalid_attrs %{name: nil, name_kanji: nil}

    def region_fixture(attrs \\ %{}) do
      {:ok, region} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geography.create_region()

      region
    end

    test "list_regions/0 returns all regions" do
      region = region_fixture()
      assert Geography.list_regions() == [region]
    end

    test "get_region!/1 returns the region with given id" do
      region = region_fixture()
      assert Geography.get_region!(region.id) == region
    end

    test "create_region/1 with valid data creates a region" do
      assert {:ok, %Region{} = region} = Geography.create_region(@valid_attrs)
      assert region.name == "some name"
      assert region.name_kanji == "some name_kanji"
    end

    test "create_region/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geography.create_region(@invalid_attrs)
    end

    test "update_region/2 with valid data updates the region" do
      region = region_fixture()
      assert {:ok, %Region{} = region} = Geography.update_region(region, @update_attrs)
      assert region.name == "some updated name"
      assert region.name_kanji == "some updated name_kanji"
    end

    test "update_region/2 with invalid data returns error changeset" do
      region = region_fixture()
      assert {:error, %Ecto.Changeset{}} = Geography.update_region(region, @invalid_attrs)
      assert region == Geography.get_region!(region.id)
    end

    test "delete_region/1 deletes the region" do
      region = region_fixture()
      assert {:ok, %Region{}} = Geography.delete_region(region)
      assert_raise Ecto.NoResultsError, fn -> Geography.get_region!(region.id) end
    end

    test "change_region/1 returns a region changeset" do
      region = region_fixture()
      assert %Ecto.Changeset{} = Geography.change_region(region)
    end
  end

  describe "prefectures" do
    alias SakeApp.Geography.Prefecture

    @valid_attrs %{name: "some name", name_kanji: "some name_kanji"}
    @update_attrs %{name: "some updated name", name_kanji: "some updated name_kanji"}
    @invalid_attrs %{name: nil, name_kanji: nil}

    def prefecture_fixture(attrs \\ %{}) do
      {:ok, prefecture} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geography.create_prefecture()

      prefecture
    end

    test "list_prefectures/0 returns all prefectures" do
      prefecture = prefecture_fixture()
      assert Geography.list_prefectures() == [prefecture]
    end

    test "get_prefecture!/1 returns the prefecture with given id" do
      prefecture = prefecture_fixture()
      assert Geography.get_prefecture!(prefecture.id) == prefecture
    end

    test "create_prefecture/1 with valid data creates a prefecture" do
      assert {:ok, %Prefecture{} = prefecture} = Geography.create_prefecture(@valid_attrs)
      assert prefecture.name == "some name"
      assert prefecture.name_kanji == "some name_kanji"
    end

    test "create_prefecture/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geography.create_prefecture(@invalid_attrs)
    end

    test "update_prefecture/2 with valid data updates the prefecture" do
      prefecture = prefecture_fixture()
      assert {:ok, %Prefecture{} = prefecture} = Geography.update_prefecture(prefecture, @update_attrs)
      assert prefecture.name == "some updated name"
      assert prefecture.name_kanji == "some updated name_kanji"
    end

    test "update_prefecture/2 with invalid data returns error changeset" do
      prefecture = prefecture_fixture()
      assert {:error, %Ecto.Changeset{}} = Geography.update_prefecture(prefecture, @invalid_attrs)
      assert prefecture == Geography.get_prefecture!(prefecture.id)
    end

    test "delete_prefecture/1 deletes the prefecture" do
      prefecture = prefecture_fixture()
      assert {:ok, %Prefecture{}} = Geography.delete_prefecture(prefecture)
      assert_raise Ecto.NoResultsError, fn -> Geography.get_prefecture!(prefecture.id) end
    end

    test "change_prefecture/1 returns a prefecture changeset" do
      prefecture = prefecture_fixture()
      assert %Ecto.Changeset{} = Geography.change_prefecture(prefecture)
    end
  end
end
