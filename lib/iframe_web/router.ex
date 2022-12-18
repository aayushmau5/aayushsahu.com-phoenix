defmodule IframeWeb.Router do
  use IframeWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", IframeWeb do
    pipe_through(:browser)
    get "/", HandleAllController, :index
  end
end
