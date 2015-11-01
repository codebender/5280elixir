defmodule Elixir5280.BlogPostController do
  use Elixir5280.Web, :controller

  alias Elixir5280.BlogPost

  def index(conn, _params) do
    blog_posts = BlogPost.all()
    render(conn, "index.json", blog_posts: blog_posts)
  end

  def show(conn, %{"id" => id}) do
    blog_post = BlogPost.get!(id)
    render(conn, "show.json", blog_post: blog_post)
  end
end
