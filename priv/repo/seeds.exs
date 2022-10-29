# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Filmelixir.Repo.insert!(%Filmelixir.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
defmodule FilmElixir.Seeds do
  alias Filmelixir.{Film, Repo}

  Repo.insert!(%Film{title: "Star Wars I", genre: "science fiction"})
  Repo.insert!(%Film{title: "Star Wars II", genre: "science fiction"})
  Repo.insert!(%Film{title: "Star Wars III", genre: "science fiction"})
  Repo.insert!(%Film{title: "Star Wars IV", genre: "science fiction"})
  Repo.insert!(%Film{title: "Star Wars V", genre: "science fiction"})
  Repo.insert!(%Film{title: "Star Wars VI", genre: "science fiction"})
  Repo.insert!(%Film{title: "Star Wars VI", genre: "science fiction"})
  Repo.insert!(%Film{title: "Star Wars VII", genre: "science fiction"})
  Repo.insert!(%Film{title: "Star Wars IX", genre: "science fiction"})
  Repo.insert!(%Film{title: "Harry Potter et la chambre des secrets", genre: "fantasy"})
  Repo.insert!(%Film{title: "Harry Potter et le prisionnier d'Askaban", genre: "fantasy"})
  Repo.insert!(%Film{title: "Harry Potter et la coupe de feu", genre: "fantasy"})
  Repo.insert!(%Film{title: "Harry Potter et l'ordre du phoenix", genre: "fantasy"})
  Repo.insert!(%Film{title: "Harry Potter et le prince de sang-mêlé", genre: "fantasy"})
  Repo.insert!(%Film{title: "Harry Potter et les reliques de la mort", genre: "fantasy"})
end
