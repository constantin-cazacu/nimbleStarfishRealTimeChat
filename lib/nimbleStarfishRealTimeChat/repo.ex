defmodule NimbleStarfishRealTimeChat.Repo do
  use Ecto.Repo,
    otp_app: :nimbleStarfishRealTimeChat,
    adapter: Ecto.Adapters.Postgres
end
