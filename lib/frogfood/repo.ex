defmodule Frogfood.Repo do
  use Ecto.Repo,
    otp_app: :frogfood,
    adapter: Ecto.Adapters.Postgres
end
