defmodule Filmelixir.Repo.Migrations.CreateFilms do
  use Ecto.Migration

  def change do
    create table(:films) do
      add :title, :string
      add :genre, :string
      add :premiere, :string
      add :runtime, :integer
      add :score, :float
      add :language, :string

      timestamps()
    end
  end
end
