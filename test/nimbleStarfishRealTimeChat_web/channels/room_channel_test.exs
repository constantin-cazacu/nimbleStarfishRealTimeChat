defmodule NimbleStarfishRealTimeChatWeb.RoomChannelTest do
  use NimbleStarfishRealTimeChatWeb.ChannelCase

  setup do
    {:ok, _, socket} =
      NimbleStarfishRealTimeChatWeb.UserSocket
      |> socket("user_id", %{some: :assign})
      |> subscribe_and_join(NimbleStarfishRealTimeChatWeb.RoomChannel, "room:lobby")

    %{socket: socket}
  end

  test "ping replies with status ok", %{socket: socket} do
    ref = push(socket, "ping", %{"hello" => "there"})
    assert_reply ref, :ok, %{"hello" => "there"}
  end

  test "shout broadcasts to room:lobby", %{socket: socket} do
    push(socket, "shout", %{"hello" => "all"})
    assert_broadcast "shout", %{"hello" => "all"}
  end

  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from!(socket, "broadcast", %{"some" => "data"})
    assert_push "broadcast", %{"some" => "data"}
  end

  test ":after_join sends all existing messages", %{socket: socket} do
    # insert a new message to send in the :after_join
    payload = %{name: "Robert", message: "test"}
    NimbleStarfishRealTimeChat.Message.changeset(%NimbleStarfishRealTimeChat.Message{}, payload)
    |> NimbleStarfishRealTimeChat.Repo.insert()

    {:ok, _, socket2} = NimbleStarfishRealTimeChatWeb.UserSocket
      |> socket("person_id", %{some: :assign})
      |> subscribe_and_join(NimbleStarfishRealTimeChatWeb.RoomChannel, "room:lobby")

    assert socket2.join_ref != socket.join_ref
  end
end
