defmodule Former.MapFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Former.Map` context.
  """

  @doc """
  Generate a unit.
  """
  def unit_fixture(attrs \\ %{}) do
    {:ok, unit} =
      attrs
      |> Enum.into(%{
        description: "some description"
      })
      |> Former.Map.create_unit()

    unit
  end
end
