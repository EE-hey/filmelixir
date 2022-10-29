defmodule Filmelixir.Repo do
  use Ecto.Repo,
    otp_app: :filmelixir,
    adapter: Ecto.Adapters.Postgres
end
