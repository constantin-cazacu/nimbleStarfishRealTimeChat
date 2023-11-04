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

#  pipeline :api do
#    plug :accepts, ["json"]
#  end

  # define the new pipeline using auth_plug
  pipeline :authOptional, do: plug(AuthPlugOptional)

  scope "/", NimbleStarfishRealTimeChatWeb do
    pipe_through [:browser, :authOptional]

    get "/", PageController, :home
    get "/login", AuthController, :login
    get "/logout", AuthController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", NimbleStarfishRealTimeChatWeb do
  #   pipe_through :api
  # end
end
