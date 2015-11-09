defmodule Elixir5280.BlogPostView do
  use Elixir5280.Web, :view

  def render("index.json", %{blog_posts: blog_posts}) do
    %{data: render_many(blog_posts, Elixir5280.BlogPostView, "blog_post.json")}
  end

  def render("show.json", %{blog_post: blog_post}) do
    %{data: render_one(blog_post, Elixir5280.BlogPostView, "blog_post.json")}
  end

  def render("blog_post.json", %{blog_post: blog_post}) do
    blog_post
  end
end
