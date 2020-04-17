defmodule Hide.Repo do
  use Ecto.Repo,
    otp_app: :hide,
    adapter: Ecto.Adapters.Postgres
end
