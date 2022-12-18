defmodule IframeWeb.HandleAllController do
  use IframeWeb, :controller

  def index(conn, _) do
    conn
    |> Plug.Conn.send_resp(200, ["Hi there!"])
  end
end
