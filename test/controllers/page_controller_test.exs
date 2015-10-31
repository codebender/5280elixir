defmodule Elixir5280.PageControllerTest do
  use Elixir5280.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
