defmodule IframeWeb.BlogChannel do
  alias IframeWeb.Presence
  use Phoenix.Channel

  def join(_room_id, _params, socket) do
    send(self(), :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    {:ok, _} = Presence.track(socket, socket.id, %{})
    push(socket, "presence_state", Presence.list(socket))

    {:noreply, socket}
  end
end
