defmodule Former.MapTest do
  use Former.DataCase

  alias Former.Map

  describe "units" do
    alias Former.Map.Unit

    import Former.MapFixtures

    @invalid_attrs %{description: nil}

    test "list_units/0 returns all units" do
      unit = unit_fixture()
      assert Map.list_units() == [unit]
    end

    test "get_unit!/1 returns the unit with given id" do
      unit = unit_fixture()
      assert Map.get_unit!(unit.id) == unit
    end

    test "create_unit/1 with valid data creates a unit" do
      valid_attrs = %{description: "some description"}

      assert {:ok, %Unit{} = unit} = Map.create_unit(valid_attrs)
      assert unit.description == "some description"
    end

    test "create_unit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Map.create_unit(@invalid_attrs)
    end

    test "update_unit/2 with valid data updates the unit" do
      unit = unit_fixture()
      update_attrs = %{description: "some updated description"}

      assert {:ok, %Unit{} = unit} = Map.update_unit(unit, update_attrs)
      assert unit.description == "some updated description"
    end

    test "update_unit/2 with invalid data returns error changeset" do
      unit = unit_fixture()
      assert {:error, %Ecto.Changeset{}} = Map.update_unit(unit, @invalid_attrs)
      assert unit == Map.get_unit!(unit.id)
    end

    test "delete_unit/1 deletes the unit" do
      unit = unit_fixture()
      assert {:ok, %Unit{}} = Map.delete_unit(unit)
      assert_raise Ecto.NoResultsError, fn -> Map.get_unit!(unit.id) end
    end

    test "change_unit/1 returns a unit changeset" do
      unit = unit_fixture()
      assert %Ecto.Changeset{} = Map.change_unit(unit)
    end
  end
end
