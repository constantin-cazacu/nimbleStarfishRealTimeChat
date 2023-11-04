# NimbleStarfishRealTimeChat

Real-Tie Chat application made using Event-Driven Architecture

To start the Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Visit [`authdemo.fly.dev`](https://authdemo.fly.dev/?referer=https://authdemo.fly.dev/apps/new&auth_client_id=2cfxNa2rRjRvhQPE24AV3AVSfh8TAMQLfYeNrHfd2LoJSUBNRkm), 
sign in with your GitHub or Google account, and create your app with `localhost:4000` as the URL, it Save
  * Copy the shown `AUTH_API_KEY` and paste in into a new `.env` file,
    e.g:
```txt
export AUTH_API_KEY=**************/authdemo.fly.dev
```
Then run:
```sh
source .env
```
OR (Windows CMD)
```txt
set AUTH_API_KEY=**************/authdemo.fly.dev
```
This will make the `AUTH_API_KEY` environment variable available.
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
