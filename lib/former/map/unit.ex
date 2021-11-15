defmodule Former.Maps.Unit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "units" do
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(unit, attrs) do
    unit
    |> cast(attrs, [:description])
    |> validate_required([:description])
    |> validate_length(:description, min: 5, max: 1000)
  end
end
