defmodule PhoenixApiProject.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_api_project,
    adapter: Ecto.Adapters.Postgres
end
