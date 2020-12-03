defmodule SakeApp.AccountsTest do
  use SakeApp.DataCase, async: true

  alias SakeApp.Accounts
  alias SakeApp.Accounts.User
  
  @valid_attrs %{
    username: "testuser",
    password: "Secret123",
    birthdate: ~D[2010-04-17],
    email: "user@email.com"
  }
  @invalid_attrs %{
    email: "1234",
    birthdate: "July 30"
  }
  @update_attrs %{
    username: "updated_name2",
    birthdate: ~D[2011-05-18],
    email: "new@email.com"
  }

  describe "users" do
    test "list_users/0 returns all users" do
      assert {:ok, %User{id: id}} = Accounts.register_user(@valid_attrs)
      assert [%User{id: ^id}] = Accounts.list_users()
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
  
  describe "update_user/2" do
    test "with valid data updates the user" do
      {:ok, user} = Accounts.register_user(@valid_attrs)
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.birthdate == ~D[2011-05-18]
      assert user.email == "new@email.com"
      assert user.username == "updated_name2"
    end

    test "with invalid data returns error changeset" do
      {:ok, user } = Accounts.register_user(@valid_attrs)
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user.username == "testuser"
      assert user.email == "user@email.com"
    end
  end

  describe "delete_user/1" do
    test "can delete a user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end
  end

  describe "register_user/1" do
    test "with valid data inserts user" do
      assert {:ok, %User{id: id} = user} = Accounts.register_user(@valid_attrs)
      assert user.username == "testuser"
      assert user.email == "user@email.com"
      assert [%User{id: ^id}] = Accounts.list_users()
    end
    
    test "with invalid data returns error" do
      assert {:error, %Ecto.Changeset{}} = Accounts.register_user(@invalid_attrs)
    end
    
    test "rejects username longer than 32" do
      long_username_attrs = Map.put(@valid_attrs, :username, "User32vHb575AeUsDYi5SeK3l5jOISxZgrUueN")
      {:error, %Ecto.Changeset{} = changeset} = Accounts.register_user(long_username_attrs)
      errors = Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} -> errors_on(msg, opts) end)
      assert errors.username == ["should be at most 32 character(s)"]
    end
  end
end
