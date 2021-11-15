defmodule Former.Repo do
  use Ecto.Repo,
    otp_app: :former,
    adapter: Ecto.Adapters.Postgres
end
