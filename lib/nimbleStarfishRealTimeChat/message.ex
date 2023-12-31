defmodule NimbleStarfishRealTimeChat.Message do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "messages" do
    field :message, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:name, :message])
    |> validate_required([:name, :message])
  end

  # Accepts  single parameter 'limit' t nly return a fixed/maximum
  # number of records, fetching all records from the database.
  def get_messages(limit \\ 20) do
    NimbleStarfishRealTimeChat.Message
    |> limit(^limit)
    |> order_by(desc: :inserted_at)
    |> NimbleStarfishRealTimeChat.Repo.all()
  end
end
