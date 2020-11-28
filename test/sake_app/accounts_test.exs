defmodule SakeApp.AccountsTest do
  use SakeApp.DataCase, async: true

  alias SakeApp.Accounts
  alias SakeApp.Accounts.User
  
  @valid_attrs %{
    name: "Test User",
    username: "testuser",
    password: "Secret123",
    birthdate: ~D[2010-04-17],
    email: "user@email.com"
  }
  @invalid_attrs %{}
  @update_attrs %{
    name: "Updated Name",
    username: "testuser2",
    password: "Secret321",
    birthdate: ~D[2011-05-18],
    emal: "test@email.com"
  }
    
  describe "users" do
    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.birthdate == ~D[2011-05-18]
      assert user.email == "some_updated@email.com"
      assert user.password_hash == "some updated password_hash"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "register_user/1" do
    test "with valid data inserts user" do
      assert {:ok, %User{id: id} = user} = Accounts.register_user(@valid_attrs)
      assert user.name == "Test User"
      assert user.username == "testuser"
      assert [%User{id: ^id}] = Accounts.list_users()
    end
  end
end
