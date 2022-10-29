defmodule Filmelixir.Film do
  use Ecto.Schema
  import Ecto.Changeset

  schema "films" do
    field :genre, :string
    field :language, :string
    field :premiere, :string
    field :runtime, :integer
    field :score, :float
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(film, attrs) do
    film
    |> cast(attrs, [:title, :genre, :premiere, :runtime, :score, :language])
    |> validate_required([:title, :genre, :premiere, :runtime, :score, :language])
  end
end
