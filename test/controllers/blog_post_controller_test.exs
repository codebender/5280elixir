defmodule Elixir5280.BlogPostControllerTest do
  use Elixir5280.ConnCase

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, blog_post_path(conn, :index)
    assert length(json_response(conn, 200)["data"]) > 1
    assert List.last(json_response(conn, 200)["data"]) == %{
      "author" => "Matthew Bender", "created_at" => "2015-01-01",
      "id" => "2015-01-01-yet-another-blog",
      "title" => "Yet Another Tech Blog"}
  end

  test "shows chosen resource", %{conn: conn} do
    conn = get conn, blog_post_path(conn, :show, "2015-01-01-yet-another-blog")
    assert json_response(conn, 200)["data"]["id"] == "2015-01-01-yet-another-blog"
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise JSONAPI.ResourceNotFound, fn ->
      get conn, blog_post_path(conn, :show, -1)
    end
  end
end
