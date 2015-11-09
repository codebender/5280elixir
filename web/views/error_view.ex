defmodule Elixir5280.ErrorView do
  use Elixir5280.Web, :view

  def render("404.html", _assigns) do
    "Page not found"
  end

  def render("500.html", _assigns) do
    "Server internal error"
  end

  def render("404.json", _assigns) do
    %{errors: %{message: "Not Found"}}
  end

  def render("500.json", _assigns) do
    %{errors: %{message: "Server Error"}}
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end
end

defmodule JSONAPI.ResourceNotFound do
  defexception plug_status: 404, message: "resource not found"
end
