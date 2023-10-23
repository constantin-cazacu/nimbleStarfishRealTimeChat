defmodule NimbleStarfishRealTimeChatWeb.Router do
  use NimbleStarfishRealTimeChatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {NimbleStarfishRealTimeChatWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NimbleStarfishRealTimeChatWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", NimbleStarfishRealTimeChatWeb do
  #   pipe_through :api
  # end
end
