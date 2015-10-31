defmodule Elixir5280.PageController do
  use Elixir5280.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
