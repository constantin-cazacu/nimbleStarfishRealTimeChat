defmodule NimbleStarfishRealTimeChatWeb.PageHTML do
  use NimbleStarfishRealTimeChatWeb, :html

  embed_templates "page_html/*"

  def person_name(person) do
    person.givenName || person.name || "guest"
  end
end
